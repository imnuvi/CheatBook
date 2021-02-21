summer = fn (a,b) -> a + b end

# the brackets can be skipped, but needs to be included during function call
alt_summer = fn x,y -> x + y end

IO.puts(summer.(4,8))
IO.puts(alt_summer.(15,4))



greeter = fn -> IO.puts("Hello there") end


greeter.()
