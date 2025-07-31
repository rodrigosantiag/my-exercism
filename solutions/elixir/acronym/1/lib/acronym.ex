defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(["-", " ", "_"])
    |> Enum.map(fn string ->
      string
      |> String.trim()
      |> String.upcase()
      |> String.first()
    end)
    |> Enum.join()
  end
end
