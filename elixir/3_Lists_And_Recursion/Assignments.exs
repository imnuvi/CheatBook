defmodule MyRecursion do
  # mapsum function that takes a list and a function, applies the function to every element in the list and sums the result

  def mapsum( list, func ), do: _mapsum( list, 0, func)

  defp _mapsum( [], value, _func ), do: value
  defp _mapsum( [ head | tail ], value, func ) do
    _mapsum(tail, value + func.(head), func)
  end
end
