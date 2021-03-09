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
end
