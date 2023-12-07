defmodule Numble.Board do
   %{guesses: [], answer: [], scores: []}

  @type answer :: [Integer.t()]
  @type guess :: [Integer.t()]
  @type score :: String.t()

  @type t :: %__MODULE__{guesses: guess(), answer: answer(), scores: [score()]}

  @spec new(answer: answer()) :: %__Module__{}
  def new(answer) do
    %__MODULE__{guesses: [], answer: answer, scores: []}
  end

  @spec take_turn(board: t(), guess: guess()) :: t()
  def take_turn(board, guess), do:  %__MODULE__{board | guesses: [guess | board.guesses], scores: [score(board.answer, guess) | board.scores] }

  @spec score(answer(), guess()) :: score()
  defp score(answer, guess), do: "R R R"
end
