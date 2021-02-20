summer = fn (a,b) -> a + b end

IO.puts(summer.(4,8))

greeter = fn -> IO.puts("Hello there") end


greeter.()
