defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case calculate_radius(x, y) do
      r when r <= 1.0 -> 10
      r when r <= 5.0 -> 5
      r when r <= 10.0 -> 1
      _ -> 0
    end
  end

  defp calculate_radius(x, y) do
    :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))
  end
end
