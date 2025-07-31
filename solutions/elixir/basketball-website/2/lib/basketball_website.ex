defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    do_extract_from_path(data, String.split(path, "."))
  end

  defp do_extract_from_path(data, [head | []]), do: data[head]

  defp do_extract_from_path(data, [head | tail]) do
    do_extract_from_path(data[head], tail)
  end

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end
end
