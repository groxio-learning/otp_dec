defmodule Numble do
  @moduledoc """
  Documentation for `Numble`.
  """

  alias Numble.{Board, Server}

  @doc """
  Use dynamic supervisor to start a game

  ## Examples

      iex> Numble.play(:jd)
      Starting jd...
      {:ok, #PID<0.170.0>}

  """
  def play(name) do
    DynamicSupervisor.start_child(:dsup, {Server, {Board.generate_answer(), name}})
  end

  @doc """
  Call Server functions to take a turn

  ## Examples

      iex> Numble.hello()
      :world

  """
  defdelegate take_turn(name, guess), to: Server
end
