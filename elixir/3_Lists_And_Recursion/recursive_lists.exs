mylist = [ 1, 2, 3 ]


[ head | tail ] = mylist
[ a, b, c ] = mylist


IO.puts(a + b + c)
IO.puts("the list values are #{a}, #{b}, #{c}")
IO.puts("the list head and tail are #{head}, #{to_string(inspect tail)}")


defmodule Mylist do
  def len( [ ] ), do: 0
  def len( [ head | tail ] ), do: 1 + len( tail )
end
