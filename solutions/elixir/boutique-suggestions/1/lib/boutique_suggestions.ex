defmodule BoutiqueSuggestions do
  @moduledoc """
  Suggests outfit combinations
  """

  @default_max_price 100

  @doc """
  Suggest outfit combinations
  """
  @spec get_combinations(list(map()), list(map()), list(keyword())) :: list(map())
  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops,
        bottom <- bottoms,
        top[:base_color] != bottom[:base_color] and
          top[:price] + bottom[:price] < (options[:maximum_price] || @default_max_price) do
      {top, bottom}
    end
  end
end
