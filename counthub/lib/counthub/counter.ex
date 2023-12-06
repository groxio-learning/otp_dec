defmodule Counthub.Counter do
  @type t :: %__MODULE__{count: integer()}

  defstruct count: 0

  @spec new(String.t()) :: t()
  def new(input) do
    n = String.to_integer(input)
    %__MODULE__{count: n}
  end

  @spec inc(t()) :: t()
  def inc(counter) do
    %{counter | count: counter.count + 1}
  end

  @spec dec(t()) :: t()
  def dec(counter) do
    %{counter | count: counter.count - 1}
  end

  @spec show(t()) :: String.t()
  def show(%__MODULE__{count: count}) do
    to_string(count)
  end
end
