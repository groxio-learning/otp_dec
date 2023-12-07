defmodule Numble.ScoreTest do
  use ExUnit.Case

  alias Numble.Score

  test "new/2" do
    answer = [1, 2, 3, 4]

    assert %Score{red: 4, white: 0} = Score.new(answer, [1, 2, 3, 4])
    assert %Score{red: 0, white: 4} = Score.new(answer, [2, 1, 4, 3])
    assert %Score{red: 0, white: 0} = Score.new(answer, [5, 6, 7, 8])
    assert %Score{red: 2, white: 1} = Score.new(answer, [1, 2, 4, 8])
    assert %Score{red: 1, white: 2} = Score.new(answer, [1, 3, 4, 8])
  end
end
