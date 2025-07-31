defmodule RPNCalculatorInspection do
  @moduledoc """
  Thorough inspection of RPN calculators.
  """

  @doc """
  Takes 2 arguments, a function (the calculator), and an input for the calculator.
  It should return a map that contains the input and the PID of the spawned process.
  """
  @spec start_reliability_check(fun(), String.t()) :: map()
  def start_reliability_check(calculator, input) do
    pid = spawn_link(fn -> calculator.(input) end)
    %{input: input, pid: pid}
  end

  @doc """
  Takes two arguments.
  The first argument is a map with the input of the reliability check and the PID of the process running the reliability check for this input, as returned by start_reliability_check/2.
  The second argument is a map that serves as an accumulator for the results of reliability checks with different inputs.
  The function should wait for an exit message or return timeout if no message with the criteria is received after 100ms.
  """
  @spec await_reliability_check_result(map(), map()) :: map()
  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    receive do
      {:EXIT, ^pid, :normal} ->
        Map.put(results, input, :ok)

      {:EXIT, ^pid, _reason} ->
        Map.put(results, input, :error)
    after
      100 ->
        Map.put(results, input, :timeout)
    end
  end

  @doc """
  Takes 2 arguments, a function (the calculator), and a list of inputs for the calculator.
  For every input on the list, it should start the reliability check in a new linked process by using start_reliability_check/2.
  Then, for every process started this way, it should await its results by using await_reliability_check_result/2.
  Before starting any processes, the function needs to flag the current process to trap exits, to be able to receive exit messages.
  Afterwards, it should reset this flag to its original value.
  The function should return a map with the results of reliability checks of all the inputs.
  """
  @spec reliability_check(fun(), list(String.t())) :: map()
  def reliability_check(calculator, inputs) do
    old_value = Process.flag(:trap_exit, true)

    result =
      Enum.map(inputs, fn input -> start_reliability_check(calculator, input) end)
      |> Enum.reduce(%{}, &await_reliability_check_result/2)

    Process.flag(:trap_exit, old_value)
    result
  end

  @doc """
  Takes 2 arguments, a function (the calculator), and a list of inputs for the calculator.
  For every input on the list, it should start an asynchronous task that will call the calculator with the given input.
  Then, for every task started this way, it should await its results for 100ms.
  """
  @spec correctness_check(fun(), list(String.t())) :: list(term())
  def correctness_check(calculator, inputs) do
    tasks = Enum.map(inputs, &Task.async(fn -> calculator.(&1) end))
    Enum.map(tasks, &Task.await(&1, 100))
  end
end
