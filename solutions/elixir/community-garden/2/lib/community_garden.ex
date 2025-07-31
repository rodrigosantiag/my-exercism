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
  def start(opts \\ %{plots: [], counter: 0}) do
    Agent.start(fn -> opts end)
  end

  @doc """
  Returnn a list of the stored plots that are registered.
  """
  @spec list_registrations(pid()) :: list(Keyword.t()) | list()
  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.plots end)
  end

  @doc """
  Add a plot to a person.
  """
  @spec register(pid(), String.t()) :: %Plot{}
  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      new_counter = state.counter + 1
      new_plot = %Plot{plot_id: new_counter, registered_to: register_to}
      {new_plot, %{state | plots: [new_plot | state.plots], counter: new_counter}}
    end)
  end

  @doc """
  Release a plot from plot list.
  """
  @spec release(pid(), integer()) :: :ok
  def release(pid, plot_id) do
    Agent.update(pid, fn state ->
      new_plots = Enum.reject(state.plots, fn plot -> plot.plot_id == plot_id end)
      %{state | plots: new_plots}
    end)
  end

  @doc """
  Returns the Plot struct with the plot's id and person registered to when it is successful.
  """
  @spec get_registration(pid(), integer()) :: %Plot{} | {:not_found, String.t()}
  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      Enum.find(state.plots, {:not_found, "plot is unregistered"}, fn plot ->
        plot.plot_id == plot_id
      end)
    end)
  end
end
