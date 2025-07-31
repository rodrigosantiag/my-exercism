defmodule Lasagna do
  @minutes_in_oven 40
  @layer_minutes 2

  def expected_minutes_in_oven do
    @minutes_in_oven
  end

  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven() - minutes
  end

  def preparation_time_in_minutes(layers) do
    layers * @layer_minutes
  end

  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end

  def alarm do
    "Ding!"
  end
end
