defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    pid = spawn_link(fn -> calculator.(input) end)
    %{input: input, pid: pid}
  end

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

  def reliability_check(calculator, inputs) do
    old_value = Process.flag(:trap_exit, true)

    results =
      inputs
      |> Enum.map(&start_reliability_check(calculator, &1))
      |> Enum.reduce(%{}, fn check_info, acc ->
        await_reliability_check_result(check_info, acc)
      end)

    Process.flag(:trap_exit, old_value)
    results
  end

  def correctness_check(calculator, inputs) do
    tasks = Enum.map(inputs, &Task.async(fn -> calculator.(&1) end))
    Enum.map(tasks, &Task.await(&1, 100))
  end
end
