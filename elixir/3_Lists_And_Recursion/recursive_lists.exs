mylist = [ 1, 2, 3 ]


[ head | tail ] = mylist
[ a, b, c ] = mylist


IO.puts(a + b + c)
IO.puts("the list values are #{a}, #{b}, #{c}")
IO.puts("the list head and tail are #{head}, #{to_string(inspect tail)}")


defmodule Mylist do

  # length function
  def len( [ ] ), do: 0
  def len( [ head | tail ] ), do: 1 + len( tail )

  # square a list function
  def square( [] ), do: []
  def square( [ head | tail ] ), do: [ head * head | square( tail ) ]

  # add 1 to every element of the list
  def add1( [] ), do: []
  def add1( [ head | tail ] ), do: [ head + 1 | add1( tail ) ]


  # map function that takes a function and applies it to the list
  def map( [], _func ), do: []
  def map( [ head | tail ], func ), do: [ func.(head) | map(tail, func) ]


  # keeping track of values can be done by passing in the variable as argument
  # a sum method that keeps track of the total sum value


  # the default value is given so as to start from 0
  def sum( a, value \\ 0 )
  def sum( [], value ), do: value
  def sum( [ head | tail ], value ), do: sum( tail, head + value )

  # another way is to define the sum function is with a public function that passes in 0 as default parameter and calls the private sum method.


  # reduce function
  def reduce( [], value, _ ), do: value
  def reduce( [ head | tail ] , value, func) do
    reduce( tail, func.(head, value), func)
  end





end
