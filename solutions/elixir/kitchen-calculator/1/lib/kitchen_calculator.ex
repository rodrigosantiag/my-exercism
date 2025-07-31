defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    unit = elem(volume_pair, 0)
    quantity = elem(volume_pair, 1)

    {:milliliter, quantity * unit_in_milliliters(unit)}
  end

  def from_milliliter(volume_pair, unit) do
    milliliter_value = elem(volume_pair, 1)

    {unit, milliliter_value / unit_in_milliliters(unit)}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end

  def unit_in_milliliters(unit = :cup) do
    get_volume({unit, 240})
  end

  def unit_in_milliliters(unit = :fluid_ounce) do
    get_volume({unit, 30})
  end

  def unit_in_milliliters(unit = :teaspoon) do
    get_volume({unit, 5})
  end

  def unit_in_milliliters(unit = :tablespoon) do
    get_volume({unit, 15})
  end

  def unit_in_milliliters(unit = :milliliter) do
    get_volume({unit, 1})
  end
end
