defmodule MyRecursion do
  # mapsum function that takes a list and a function, applies the function to every element in the list and sums the result
  def mapsum( list, func ), do: _mapsum( list, 0, func)

  # privates
  defp _mapsum( [], value, _func ), do: value
  defp _mapsum( [ head | tail ], value, func ) do
    _mapsum(tail, value + func.(head), func)
  end



  # Max function that returns the maximum of a list

  def getmax( list ), do: _getmax( list, 0 )

  defp _getmax( [], value ), do: value
  defp _getmax( [ head | tail ], value ) when (head > value) do
    _getmax( tail, head )
  end

  defp _getmax( [ head | tail ], value ) when (head < value) do
    _getmax( tail, value )
  end



  # caesar cypher that gets a string( which is actually a list ) and adds a number n to each element.
  def caesar( [ ], n ), do: []
  def caesar( [ head | tail ], n ) when head+n < 123 do
    [ head + n | caesar(tail, n) ]
  end
  def caesar( [ head | tail ], n ) when head+n > 123 do
    [ rem((head+n - 122), 26) + 97 | caesar(tail, n) ]
  end


  # filter function that returns a list with elements that satisfy a function
  # def filter( [], func, newl ), do: newl
  # def filter( [ head | tail ], func, newl ) when func.(head) do
  #   filter( tail, func, newl ++ [head] )
  # end
  # def filter( [ head | tail ], func, newl ) when !(func.head) do
  #   filter( tail, func, newl )
  # end




end
