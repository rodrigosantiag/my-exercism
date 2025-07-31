defmodule Chessboard do
  @moduledoc """
  As a chess enthusiast, this module creates a chessboard.
  Rows are called "ranks" and columns are called "files"
  """
  @doc """
  Define the rank range
  """
  @spec rank_range() :: Range.t()
  def rank_range do
    1..8
  end

  @doc """
  Define the file range
  """
  @spec file_range() :: Range.t()
  def file_range do
    ?A..?H
  end

  @doc """
  Transform the rank range into a list of ranks
  """
  @spec ranks() :: list(integer())
  def ranks do
    rank_range() |> Enum.to_list()
  end

  @doc """
  Transform the file range into a list of files
  """
  @spec files() :: list(String.t())
  def files do
    file_range() |> Enum.map(fn file -> <<file>> end)
  end
end
