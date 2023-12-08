defmodule Numble.Server do
  use GenServer

  alias Numble.Board

  # ----------------------------------------------
  # Client

  def start_link({input, name}) do
    GenServer.start_link(__MODULE__, input, name: name)
  end

  def take_turn(pid, guess) do
    GenServer.call(pid, {:take_turn, guess})
    |> IO.puts()
  end

  # ----------------------------------------------
  # Server

  @impl true
  def init(answer) do
    IO.puts("Starting...")
    board = Board.new(answer)
    {:ok, board}
  end

  @impl true
  def handle_call({:take_turn, guess}, _from, board) do
    new_board = Board.take_turn(board, guess)
    {:reply, Board.show(new_board), new_board}
  end
end
