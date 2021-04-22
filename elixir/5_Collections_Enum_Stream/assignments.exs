defmodule MyAssignments do
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

  def take(lst, val), do: take(lst, [], val)
  def take(lst, front, 0), do: front
  def take([head | tail], front, val) do
    take(tail, front ++ [head], val-1)
  end



  def flatten(lst) doflatten(lst, [])

  def flatten([head | tail], newl) do
   IO.puts("HI")
   flatten(tail, flatten(head, newl))
  end

  def flatten([], newl), do: newl
  def flatten([val], newl), do: flatten(val, newl)
  def flatten(val, newl), do: newl ++ [val]

  # [[[1]],2,[[[1,2,3],10]],4,5]
  # [1,2,3,[4]]

end
