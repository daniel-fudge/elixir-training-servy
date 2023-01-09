defmodule Nap.Napper do
  def power_nap() do
    time = :rand.uniform(10_000)
    :timer.sleep(time)
    time
  end

  def print() do
    "Slept #{power_nap()} ms"
  end
end
