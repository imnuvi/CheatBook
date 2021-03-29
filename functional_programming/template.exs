# this is a sample program to get started with functional programming. This will have multiple problems with increasing levels of difficulty
defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def main(n, lst) do
        IO.puts(n + Enum.at(lst, 0))
    end
end


lines = IO.read(:stdio, :all)
[ n, lst ] = String.split(lines)


n = n
    |> String.replace("\r","")
    |> String.replace("\n","")
    |> String.to_integer
#    |> IO.inspect


lst = lst
    |> String.split(" ")
    |> Enum.map(&(String.to_integer(&1)))
#    |> IO.inspect


Solution.main(n,lst)
