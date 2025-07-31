defmodule CaptainsLog do
  @moduledoc """
  MOdule with random generators for data commonly appearing in the captain's log.
  """

  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  @doc """
  Pick a planet class randomly
  """
  @spec random_planet_class() :: String.t()
  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  @doc """
  Genrerate starship's registry number
  """
  @spec random_ship_registry_number() :: String.t()
  def random_ship_registry_number() do
    "NCC-#{Enum.random(1000..9999)}"
  end

  @doc """
  Generate a random stardate
  """
  @spec random_stardate() :: float()
  def random_stardate() do
    41000 + :rand.uniform() * 1000
  end

  @doc """
  Round a stardate to a single decimal place as string
  """
  @spec format_stardate(float()) :: binary()
  def format_stardate(stardate) do
    :io_lib.format("~.1f", [stardate]) |> IO.iodata_to_binary()
  end
end
