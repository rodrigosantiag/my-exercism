defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
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

  def divide(stack) do
    do_divide(stack)
  end

  defp do_divide(stack)

  defp do_divide([head, tail]) do
    case head do
      0 ->
        raise DivisionByZeroError

      _ ->
        tail / head
    end
  end

  defp do_divide([_head]) do
    raise StackUnderflowError, "when dividing"
  end

  defp do_divide([]) do
    raise StackUnderflowError, "when dividing"
  end
end
