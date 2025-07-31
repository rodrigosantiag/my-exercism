defmodule RPNCalculator do
  @moduledoc """
  Experimental Reverse Polish Notation [RPN]
  """
  @doc """
  Calculate operation with stack argument
  """
  @spec calculate(list(), function()) :: :ok
  def calculate!(stack, operation) do
    operation.(stack)
  end

  @doc """
  Calulate operation without raising exception
  """
  @spec calculate(list(), function()) :: {:ok, String.t()} | {:error}
  def calculate(stack, operation) do
    try do
      {:ok, operation.(stack)}
    rescue
      _ -> :error
    end
  end

  @doc """
  Calculate operation returning error message
  """
  @spec calculate_verbose(list(), function()) :: {:ok, String.t()} | {:error, String.t()}
  def calculate_verbose(stack, operation) do
    try do
      {:ok, calculate!(stack, operation)}
    rescue
      e in _ -> {:error, e.message}
    end
  end
end
