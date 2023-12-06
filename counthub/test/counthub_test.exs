defmodule CounthubTest do
  use ExUnit.Case
  doctest Counthub

  test "greets the world" do
    assert Counthub.hello() == :world
  end
end
