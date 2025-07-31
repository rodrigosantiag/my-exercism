defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input), do: do_calc(input, 0)

  @spec do_calc(pos_integer(), non_neg_integer()) :: non_neg_integer()
  defp do_calc(1, steps), do: steps

  defp do_calc(n, _steps) when is_binary(n) or n <= 0,
    do: raise(FunctionClauseError, "Input must be a positive integer")

  defp do_calc(n, steps) when rem(n, 2) == 0, do: do_calc(round(n / 2), steps + 1)
  defp do_calc(n, steps), do: do_calc(n * 3 + 1, steps + 1)
end
