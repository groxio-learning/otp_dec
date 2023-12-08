defmodule Numble.Server do
  use GenServer

  alias Numble.Board

  # ----------------------------------------------
  # Client

  def start_link({answer, name}) do
    GenServer.start_link(__MODULE__, {answer, name}, name: name)
  end

  def take_turn(pid, guess) do
    GenServer.call(pid, {:take_turn, guess})
    |> IO.puts()
  end

  # ----------------------------------------------
  # Server

  @impl true
  def init({answer, name}) do
    IO.puts("Starting #{name}...")
    board = Board.new(answer)
    {:ok, board}
  end

  @impl true
  def handle_call({:take_turn, guess}, _from, board) do
    new_board = Board.take_turn(board, guess)

    if Board.show_status(new_board) == "playing" do
      {:reply, Board.show(new_board), new_board}
    else
      {:stop, :normal, Board.show(new_board), new_board}
    end
  end

  def child_spec({answer, name}) do
    %{
      id: name,
      start: {Numble.Server, :start_link, [{answer, name}]}
    }
  end
end
