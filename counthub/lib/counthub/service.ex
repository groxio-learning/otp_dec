defmodule Counthub.Service do
  alias Counthub.Counter

  def start_link(input) do
    counter = Counter.new(input)
    spawn_link(fn -> loop(counter) end)
  end

  def loop(counter) do
    counter
    |> listen()
    |> loop()
  end

  def listen(counter) do
    receive do
      :inc ->
        Counter.inc(counter)
      :dec ->
        Counter.dec(counter)
      {:show, from_pid} ->
        send(from_pid, Counter.show(counter))
        counter
    end
  end
end
