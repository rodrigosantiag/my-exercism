defmodule Anagram do
  @moduledoc """
  Anagram module.
  """

  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.reject(&(String.downcase(base) == String.downcase(&1)))
    |> Enum.filter(&is_anagram?(base, &1))
  end

  @spec is_anagram?(String.t(), String.t()) :: boolean()
  defp is_anagram?(base, candidate) do
    base
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort() ==
      candidate
      |> String.downcase()
      |> String.graphemes()
      |> Enum.sort()
  end
end
