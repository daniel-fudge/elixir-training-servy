defmodule Recurse do

  def sum(values) do
    sum(values, 0)
  end

  def sum([head | tail], total) do
    sum(tail, total + head)
  end

  def sum([], total), do: IO.puts total

  def triple([head | tail]) do
    [3*head | triple(tail)]
  end

  def triple([]), do: []

end

# Recurse.sum([1, 2, 3, 4, 5])

IO.inspect Recurse.triple([1, 2, 3, 4, 5])
