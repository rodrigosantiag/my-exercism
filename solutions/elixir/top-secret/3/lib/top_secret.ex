defmodule TopSecret do
  @moduledoc """
  Module to encode and decode secret messages
  """

  @doc """
  Returns an AST from an Elixir code as string

  ## Parameters

    - string: Elixir code in string format

  ## Example

    iex> TopSecret.to_ast("div(4, 3)")
    {:div, [line: 1], [4, 3]}

  """
  @spec to_ast(String.t()) :: tuple()
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  @doc """
  Taken an AST node and an accumulator for the secret message.
  Retuns a tuple with the AST node unchanged as the first element, and the accumulator as the second element.

  If the AST node is defining a function, prepend the function name to the accumulator.

  ## Parameters

    - ast: AST node
    - acc: Accumulator

  ## Examples

    iex> ast_node = TopSecret.to_ast("defp cat(a, b, c), do: nil")
    TopSecret.decode_secret_message_part(ast_node, ["day"])
    {ast_node, ["cat", "day"]}

    iex> ast_node = TopSecret.to_ast("10 + 3")
    TopSecret.decode_secret_message_part(ast_node, ["day"])
    {ast_node, ["day"]}
  """
  @spec decode_secret_message_part(tuple(), list()) :: tuple()
  def decode_secret_message_part({opertion, _, arguments} = ast, acc)
      when opertion in [:def, :defp],
      do: {ast, do_accumulator(arguments, acc)}

  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

  @doc """
  Receives a string with Elixir code and returns the secret message from all function definitions found in the code.

  ## Parameters

    - string: String with Elixir code

  ## Example

    iex> code = \"""
    defmodule MyCalendar do
      def busy?(date, time) do
        Date.day_of_week(date) != 7 and
          time.hour in 10..16
        end

      def yesterday?(date) do
        Date.diff(Date.utc_today, date)
      end
    end
    \"""

    TopSecret.decode_secret_message(code)
    "buy"
  """
  @spec decode_secret_message(String.t()) :: String.t()
  def decode_secret_message(string) do
    ast = to_ast(string)
    {_, acc} = Macro.prewalk(ast, [], &decode_secret_message_part/2)
    acc |> Enum.reverse() |> Enum.join()
  end

  @spec do_accumulator(list(), list()) :: list()
  defp do_accumulator(arguments, acc) do
    [head | _] = arguments
    {atom_operation, _, arities} = head

    case atom_operation do
      :when ->
        do_accumulator(arities, acc)

      _ ->
        arity = if arities, do: Enum.count(arities), else: 0
        function_name = Atom.to_string(atom_operation) |> String.slice(0, arity)
        [function_name | acc]
    end
  end
end
