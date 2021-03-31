defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def main(n) do
        IO.inspect(Enum.into(1..n, []))
    end
end

val = IO.read(:stdio, :line)

n = val
  |> String.trim
  |> String.to_integer


Solution.main(n)
