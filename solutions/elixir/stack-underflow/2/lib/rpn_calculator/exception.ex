defmodule RPNCalculator.Exception do
  @moduledoc """
  Set of exceptions for RPNCalculator which follow the "Exception Behaviour".
  """

  defmodule DivisionByZeroError do
    @moduledoc """
    Division by zero error
    """
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    @moduledoc """
    Exception for stack underflow
    """
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] ->
          %StackUnderflowError{}

        _ ->
          %StackUnderflowError{message: "stack underflow occurred, context: " <> value}
      end
    end
  end

  @doc """
  A division function which divides a stack of numbers
  """
  @spec divide(list(number())) :: float()
  def divide(stack) do
    do_divide(stack)
  end

  defp do_divide(stack)

  defp do_divide([]) do
    raise StackUnderflowError, "when dividing"
  end

  defp do_divide([_head]) do
    raise StackUnderflowError, "when dividing"
  end

  defp do_divide([0, _tail]), do: raise(DivisionByZeroError)

  defp do_divide([head, tail]) do
    tail / head
  end
end
