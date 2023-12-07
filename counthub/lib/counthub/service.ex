defmodule Counthub.Service do
  alias Counthub.Counter

  # Client
  def start_link(input) do
    counter = Counter.new(input)
    spawn_link(fn -> loop(counter) end)
  end

  def inc(counter_pid) do
    send(counter_pid, :inc)
  end

  def dec(counter_pid) do
    send(counter_pid, :dec)
  end

  def show(counter_pid) do
    send(counter_pid, {:show, self()})

    receive do
      msg ->
        msg
    end
  end

  # Server
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
