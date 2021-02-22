summer = fn (a,b) -> a + b end

# the brackets can be skipped, but needs to be included during function call
alt_summer = fn x,y -> x + y end

IO.puts(summer.(4,8))
IO.puts(alt_summer.(15,4))


# No input function.
greeter = fn -> IO.puts("Hello there") end


greeter.()


# swap function with pattern matching
swapper = fn { a, b } -> { b, a } end


IO.puts(inspect swapper.( { 5, 10 } ))


# List concatenator
list_concat = fn lst1, lst2 -> lst1 ++ lst2 end

IO.puts(inspect list_concat.([3,4,5,6],[1,2,3]))


# triple summer
triple_summer = fn a, b, c -> a+b+c end

IO.puts(triple_summer.(5,10,15))


# pair_tuple_to_list
pair_tuple_to_list = fn { a, b } -> [ a, b ] end


IO.puts(pair_tuple_to_list.({ 345, 786 }))
