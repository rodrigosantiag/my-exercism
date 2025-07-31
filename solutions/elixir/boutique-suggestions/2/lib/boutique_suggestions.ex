defmodule BoutiqueSuggestions do
  @moduledoc """
  Suggests outfit combinations
  """

  @type outfit_item() :: %{
          item_name: String.t(),
          price: float(),
          color: String.t(),
          base_color: String.t()
        }

  @default_max_price 100

  @doc """
  Suggest outfit combinations
  """
  @spec get_combinations(list(outfit_item()), list(outfit_item()), Keyword.t()) ::
          list({outfit_item(), outfit_item()})
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = Keyword.get(options, :maximum_price, @default_max_price)

    for top <- tops,
        bottom <- bottoms,
        top[:base_color] != bottom[:base_color] and
          top[:price] + bottom[:price] < max_price do
      {top, bottom}
    end
  end
end
