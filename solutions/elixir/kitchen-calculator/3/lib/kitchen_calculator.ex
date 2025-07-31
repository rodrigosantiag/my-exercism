defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:cup, volume}) do
    {:milliliter, volume * 240}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, volume * 30}
  end

  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, volume * 5}
  end

  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, volume * 15}
  end

  def to_milliliter(volume_pair) do
    volume_pair
  end

  def from_milliliter(volume_pair, unit) do
    {unit, get_volume(volume_pair) / (to_milliliter({unit, 1}) |> get_volume)}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end
end
