defmodule RemoteControlCar do
  @moduledoc """
  Remote Control Car module
  Cars start with full (100%) batteries.
  Each time you drive the car using the remote control, it covers 20 meters and drains one percent of the battery.
  The car's nickname is not known until it is created.
  """
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  @doc """
  Create a brand-new remote controlled car with a nickname
  """
  @spec new(String.t()) :: %RemoteControlCar{
          battery_percentage: 100,
          distance_driven_in_meters: 0,
          nickname: String.t()
        }
  def new(nickname \\ "none"), do: %RemoteControlCar{nickname: nickname}

  @doc """
  Display the distance
  """
  @spec display_distance(%RemoteControlCar{}) :: String.t()
  def display_distance(remote_car = %RemoteControlCar{}) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  @doc """
  Display the battery percentage
  """
  @spec display_battery(%RemoteControlCar{}) :: String.t()
  def display_battery(_remote_car = %RemoteControlCar{battery_percentage: 0}), do: "Battery empty"

  def display_battery(remote_car = %RemoteControlCar{}) do
    "Battery at #{remote_car.battery_percentage}%"
  end

  @doc """
  Driving changes the battery and distance driven
  """
  @spec drive(%RemoteControlCar{}) :: %RemoteControlCar{}
  def drive(remote_car = %RemoteControlCar{battery_percentage: 0}), do: remote_car

  def drive(remote_car = %RemoteControlCar{}) do
    %{
      remote_car
      | battery_percentage: remote_car.battery_percentage - 1,
        distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
    }
  end
end
