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

  def my_map([head | tail], f) do
    my_map(tail, [f.(head)], f)
  end

  def my_map([head | tail], new_list, f) do
    my_map(tail, [f.(head)] ++ new_list, f)
  end

  def my_map([], new_list, _f) do
    Enum.reverse(new_list)
  end

end

nums = [1, 2, 3, 4, 5]

# Recurse.sum(nums)
# IO.inspect Recurse.triple(nums)
# IO.inspect Enum.map(nums, &(&1 * 3))
IO.inspect Recurse.my_map(nums, &(&1 * 3))
