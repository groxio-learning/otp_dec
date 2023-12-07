defmodule Counthub.ServerTest do
  use ExUnit.Case

  alias Counthub.Server

  test "integration" do
    {:ok, pid} = Server.start_link("100")
    Server.inc(pid)
    Server.inc(pid)
    Server.inc(pid)
    Server.dec(pid)
    assert "102" = Server.show(pid)
  end
end
