defmodule Counthub.Server do
  use GenServer

  alias Counthub.Counter

  # ----------------------------------------------
  # Client

  def start_link(input) do
    GenServer.start_link(__MODULE__, input)
  end

  def inc(pid) do
    GenServer.cast(pid, :inc)
  end

  def dec(pid) do
    GenServer.cast(pid, :dec)
  end

  def show(pid) do
    GenServer.call(pid, :show)
  end

  # ----------------------------------------------
  # Server

  @impl true
  def init(input) do
    counter = Counter.new(input)
    {:ok, counter}
  end

  @impl true
  def handle_cast(:inc, counter) do
    {:noreply, Counter.inc(counter)}
  end

  @impl true
  def handle_cast(:dec, counter) do
    {:noreply, Counter.dec(counter)}
  end

  @impl true
  def handle_call(:show, _from, counter) do
    {:reply, Counter.show(counter), counter}
  end
end
