defmodule MyCollections do
  # stole this from the solutions cause I had no clue.
  def all?(list) do
    all?(list, fn x -> !!x end)
  end
  def all?([], func), do: true
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], func), do: []
  def each([head, tail], func) do
    [func.(head) | each(tail, func)]
  end

  def filter([], func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail,func)]
    else
      filter(tail, func)
    end
  end

  def split(lst, val), do: split(lst, [], val)
  def split(lst, first, 0), do: {first, lst}
  def split([head | tail], first, val) do
    split(tail, first ++ [head], val-1)
  end

end
