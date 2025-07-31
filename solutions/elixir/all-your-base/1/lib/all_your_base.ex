defmodule AllYourBase do
  @moduledoc """
  Translates numbers from one base to another
  """

  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """
  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_digits, input_base, _output_base) when input_base < 2,
    do: {:error, "input base must be >= 2"}

  def convert(_digits, _input_base, output_base) when output_base < 2,
    do: {:error, "output base must be >= 2"}

  def convert(digits, input_base, output_base) do
    cond do
      Enum.any?(digits, &(&1 < 0 or &1 >= input_base)) ->
        {:error, "all digits must be >= 0 and < input base"}

      true ->
        convert_from_input_base(digits, input_base)
        |> convert_to_output_base(output_base, [])
    end
  end

  @spec convert_from_input_base(list(integer()), integer()) :: integer() | {:error, String.t()}
  defp convert_from_input_base(digits, input_base) do
    {result, _} =
      Enum.reduce(digits, {0, Enum.count(digits) - 1}, fn digit, acc ->
        {number, exponent} = acc
        new_number = number + digit * input_base ** exponent
        new_exponent = exponent - 1
        {new_number, new_exponent}
      end)

    result
  end

  @spec convert_to_output_base(integer(), integer(), list()) :: {:ok, list(integer())}
  defp convert_to_output_base(0, _output_base, []) do
    {:ok, [0]}
  end

  defp convert_to_output_base(number, output_base, result) do
    if number == 0 do
      {:ok, result}
    else
      remainder = rem(number, output_base)
      quotient = div(number, output_base)
      convert_to_output_base(quotient, output_base, [remainder | result])
    end
  end
end
