defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def main(n) do
        Enum.each(1..n, fn (_x) -> (IO.puts("Hello World")) end)
    end
end

value = IO.read(:stdio, :all)

n = value
    |> String.trim
    |> String.to_integer

Solution.main(n)
