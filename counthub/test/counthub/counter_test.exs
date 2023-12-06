defmodule Counthub.CounterTest do
  use ExUnit.Case

  alias Counthub.Counter

  test "new/1" do
    assert %Counter{count: 42} = Counter.new("42")
  end

  test "inc/1" do
    counter = Counter.new("42")
    assert %Counter{count: 43} = Counter.inc(counter)
  end

  test "dec/1" do
    counter = Counter.new("42")
    assert %Counter{count: 41} = Counter.dec(counter)
  end

  test "show/1" do
    counter = Counter.new("42")
    assert Counter.show(counter) == "42"
  end

  def assert_count(actual, expected) do
    assert actual.count == expected
    actual
  end

  test "crc test" do
    actual =
      "42"
      |> Counter.new()
      |> assert_count(42)
      |> Counter.inc()
      |> assert_count(43)
      |> Counter.inc()
      |> assert_count(44)
      |> Counter.dec()
      |> assert_count(43)
      |> Counter.show()

    assert actual == "43"
  end
end
