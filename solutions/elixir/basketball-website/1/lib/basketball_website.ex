defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    get_value(data, String.split(path, "."), nil)
  end

  defp get_value(_data, [], value), do: value

  defp get_value(data, path, _value) do
    [head | tail] = path
    value = data[head]
    get_value(value, tail, value)
  end

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end
end
