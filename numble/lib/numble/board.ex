defmodule Numble.Board do

  @type answer :: [Integer.t()]
  @type guess :: [Integer.t()]
  @type score :: String.t()

  @type t :: %__MODULE__{guesses: guess(), answer: answer(), scores: [score()]}

  defstruct guesses: [], answer: [], scores: []

  @spec new(answer: answer()) :: %__MODULE__{}
  def new(answer) do
    %__MODULE__{guesses: [], answer: answer, scores: []}
  end

  @spec take_turn(t(), guess()) :: t()
  def take_turn(board, guess), do:  %__MODULE__{board | guesses: [guess | board.guesses], scores: [score(board.answer, guess) | board.scores] }

  @spec score(answer(), guess()) :: score()
  defp score(_answer, _guess), do: "R R R"
end
