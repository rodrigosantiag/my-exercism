defmodule BoutiqueInventory do
  @spec sort_by_price([map()]) :: [map()]
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1[:price])
  end

  @spec with_missing_price([map()]) :: [map()]
  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item[:price] == nil end)
  end

  @spec update_names([map()], String.t(), String.t()) :: [map()]
  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      Map.new(item, fn {key, value} ->
        case key do
          :name -> {key, String.replace(value, old_word, new_word)}
          _ -> {key, value}
        end
      end)
    end)
  end

  @spec increase_quantity(map(), non_neg_integer()) :: map()
  def increase_quantity(item, count) do
    %{
      item
      | quantity_by_size:
          Map.new(item[:quantity_by_size], fn {key, value} -> {key, value + count} end)
    }
  end

  @spec total_quantity(map()) :: non_neg_integer()
  def total_quantity(item) do
    Map.values(item[:quantity_by_size]) |> Enum.reduce(0, &+/2)
  end
end
