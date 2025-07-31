defmodule TakeANumberDeluxe do
  @moduledoc """
  Module that keeps track of currently queued numbers
  """

  alias ElixirSense.Core.State
  # Client API
  use GenServer
  alias TakeANumberDeluxe.State

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: TakeANumberDeluxe.State.t()
  def report_state(machine) do
    GenServer.call(machine, :report_state)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    GenServer.call(machine, :queue_new_number)
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    GenServer.call(machine, {:serve_next_queued_number, priority_number})
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    GenServer.cast(machine, :reset_state)
  end

  # Server callbacks

  @impl GenServer
  @spec init(keyword()) ::
          {:stop, :invalid_configuration} | {:ok, pid(), timeout()}
  def init(init_args) do
    timeout =
      if is_nil(init_args[:auto_shutdown_timeout]),
        do: :infinity,
        else: init_args[:auto_shutdown_timeout]

    case State.new(init_args[:min_number], init_args[:max_number], timeout) do
      {:ok, state} -> {:ok, state, timeout}
      _ -> {:stop, :invalid_configuration}
    end
  end

  @impl GenServer
  @spec handle_call(:report_state, term(), term()) :: {:reply, term(), term(), timeout()}
  def handle_call(:report_state, _from, state) do
    {:reply, state, state, state.auto_shutdown_timeout}
  end

  @impl GenServer
  @spec handle_call(:queue_new_number, term(), term()) :: {:reply, keyword(), term(), timeout()}
  def handle_call(:queue_new_number, _from, state) do
    case State.queue_new_number(state) do
      {:ok, next_number, new_state} ->
        {:reply, {:ok, next_number}, new_state, new_state.auto_shutdown_timeout}

      {:error, error} ->
        {:reply, {:error, error}, state, state.auto_shutdown_timeout}
    end
  end

  @impl GenServer
  @spec handle_call(:serve_next_queued_number, term(), term()) ::
          {:reply, keyword(), term(), timeout()}
  def handle_call({:serve_next_queued_number, priority_number} = _message, _from, state) do
    case State.serve_next_queued_number(state, priority_number) do
      {:ok, next_number, new_state} ->
        {:reply, {:ok, next_number}, new_state, new_state.auto_shutdown_timeout}

      {:error, error} ->
        {:reply, {:error, error}, state, state.auto_shutdown_timeout}
    end
  end

  @impl GenServer
  @spec handle_cast(:reset_state, term()) :: {:noreply, term(), timeout()}
  def handle_cast(:reset_state, state) do
    {:ok, state} = State.new(state.min_number, state.max_number, state.auto_shutdown_timeout)
    {:noreply, state, state.auto_shutdown_timeout}
  end

  @impl GenServer
  @spec handle_info(term(), term()) :: {:stop, :normal, term()} | {:noreply, term(), timeout()}
  def handle_info(:timeout, state) do
    {:stop, :normal, state}
  end

  @impl GenServer
  def handle_info(_, state) do
    {:noreply, state, state.auto_shutdown_timeout}
  end
end
