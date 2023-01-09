defmodule NapTest do
  use ExUnit.Case
  doctest Nap

  test "greets the world" do
    assert Nap.hello() == :world
  end
end
