defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\]/
  end

  def split_line(line) do
    Regex.split(~r/<[~*=\-]*>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line\d+/i, line, "")
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User[\s\t]+([\S\x{10000}-\x{10FFFF}]+)/u, line) do
      [_whole_math, username] -> "[USER] #{username} " <> line
      nil -> line
    end
  end
end
