defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(options :: opts()) :: {:ok, opts()} | {:error, error()}
  @callback handle_frame(dot :: dot(), frame_number :: frame_number(), options :: opts()) :: dot()

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, _options) do
    cond do
      rem(frame_number, 4) == 0 -> %{dot | opacity: dot.opacity / 2}
      true -> dot
    end
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def init([{:velocity, value} | _] = options) do
    if is_number(value),
      do: {:ok, options},
      else:
        {:error,
         "The :velocity option is required, and its value must be a number. Got: #{inspect(value)}"}
  end

  def init(options) do
    {:error,
     "The :velocity option is required, and its value must be a number. Got: #{inspect(Keyword.get(options, :velocity))}"}
  end

  @impl DancingDots.Animation
  def handle_frame(dot, frame_number, options) do
    radius_increment = (frame_number - 1) * Keyword.get(options, :velocity)
    %{dot | radius: dot.radius + radius_increment}
  end
end
