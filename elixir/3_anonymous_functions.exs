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


# file opener ( multiple bodies in same function )
handle_file = fn
  { :ok, file } -> "Read data: #{IO.read(file, :line)}"
  { _, error } -> "Error: #{:file.format_error(error)}"
end


IO.puts(handle_file.(File.open("./practice_data/data.txt")))
IO.puts(handle_file.(File.open("nonexistent.txt")))









# Exercises
# Crazy fizz buzz. Write a function which takes three arguments. If the first two arguments are 0 print FizzBuzz, if first argument is 0, print fizz, if second argument is 0 print buzz, else print the third element


fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, val) -> val
end

IO.puts(fizzbuzz.(8,8,99))
IO.puts(fizzbuzz.(0,0,44))



fizz_main = fn
  (n) -> fizzbuzz.(rem(n,3), rem(n,5), n)
end

IO.puts(fizz_main.(2))
IO.puts(fizz_main.(3))
IO.puts(fizz_main.(4))
IO.puts(fizz_main.(5))
IO.puts(fizz_main.(6))
IO.puts(fizz_main.(7))
IO.puts(fizz_main.(8))
IO.puts(fizz_main.(9))
IO.puts(fizz_main.(10))
IO.puts(fizz_main.(11))
IO.puts(fizz_main.(12))
IO.puts(fizz_main.(13))
IO.puts(fizz_main.(14))
IO.puts(fizz_main.(15))




#
