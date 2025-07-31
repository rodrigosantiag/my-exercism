# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  @moduledoc """
  Module to manage the community garden registrations
  """

  @doc """
  Start communiy garden agent.
  """
  @spec start() :: {:error, any()} | {:ok, pid()}
  def start(opts \\ []) do
    Agent.start(fn -> {[], 0} end, opts)
  end

  @doc """
  Returnn a list of the stored plots that are registered.
  """
  @spec list_registrations(pid()) :: list(Keyword.t()) | list()
  def list_registrations(pid) do
    Agent.get(pid, fn {plots, _counter} -> plots end)
  end

  @doc """
  Add a plot to a person.
  """
  @spec register(pid(), String.t()) :: %Plot{}
  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {plots, counter} ->
      new_counter = counter + 1
      new_plot = %Plot{plot_id: new_counter, registered_to: register_to}
      {new_plot, {[new_plot | plots], new_counter}}
    end)
  end

  @doc """
  Release a plot from plot list.
  """
  @spec release(pid(), integer()) :: :ok
  def release(pid, plot_id) do
    Agent.update(pid, fn {plots, counter} ->
      new_plots = Enum.reject(plots, fn plot -> plot.plot_id == plot_id end)
      {new_plots, counter}
    end)
  end

  @doc """
  Returns the Plot struct with the plot's id and person registered to when it is successful.
  """
  @spec get_registration(pid(), integer()) :: %Plot{} | {:not_found, String.t()}
  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {plots, _counter} ->
      Enum.find(plots, {:not_found, "plot is unregistered"}, fn plot ->
        plot.plot_id == plot_id
      end)
    end)
  end
end
