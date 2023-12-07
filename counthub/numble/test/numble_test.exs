defmodule NumbleTest do
  use ExUnit.Case
  doctest Numble

  test "greets the world" do
    assert Numble.hello() == :world
  end
end
