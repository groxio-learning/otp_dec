defmodule Numble.Board do
  alias Numble.Score

  @type answer :: [Integer.t()]
  @type guess :: [Integer.t()]

  @type t :: %__MODULE__{guesses: guess(), answer: answer(), scores: [Score.t()]}

  defstruct guesses: [], answer: [], scores: []

  @spec new(answer: answer()) :: %__MODULE__{}
  def new(answer) do
    %__MODULE__{guesses: [], answer: answer, scores: []}
  end

  @spec take_turn(t(), guess()) :: t()
  def take_turn(board, guess) do
    %__MODULE__{
      board
      | guesses: [guess | board.guesses],
        scores: [Score.new(board.answer, guess) | board.scores]
    }
  end


  def generate_answer(), do: generate_answer(:unique)

  def generate_answer(:unique), do: 1..8 |> Enum.shuffle() |> Enum.take(4)

  def generate_answer(:duplicates),
    do:
      fn -> :rand.uniform(8) end
      |> Stream.repeatedly()
      |> Enum.take(4)


   @doc """
    1 2 3 4 | RRW
    1 2 3 4 | RRW
    1 2 3 4 | RRW
    1 2 3 4 | RRW
    playing | won | lost
   """
  @spec show(t()) :: String.t()
  def show(board) do
    turns = Enum.zip(board.guesses, board.scores)

    # [[1,2,3,4], [4,4,4,4]], ["RRW", "RRR"]
    """
    #{show_turns(board.answer, turns)}
    #{show_status(board)}
    """
  end


  defp show_turns(answer, turns) do
    Enum.map(turns, fn turn -> show_turn(answer, turn) end)
  end

  defp show_turn(answer, {guess, score}), do: "#{inspect(guess)} | #{Score.show(score)}\n"

  defp show_status(%{answer: answer, guesses: [answer | _]}) do
    "won"
  end

  defp show_status(%{guesses: guesses}) do
    cond do
      length(guesses) >= 10 ->
        "lost"
      :otherwise ->
        "playing"
    end
  end
end
