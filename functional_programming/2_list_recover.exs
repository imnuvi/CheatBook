#  given a list put each element n times in a new array



defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def main(n, lst) do
        Enum.each(lst, fn(x) ->
            Enum.each(0..n-1, fn(_y) ->
                IO.puts("#{x}")
            end)
        end)
    end
end

vals = IO.read(:stdio, :all)

[ n | lst ] = String.split(vals)

n = n
    |> String.trim
    |> String.to_integer

lst = lst
    |> Enum.map(&(String.to_integer(&1)))


Solution.main(n,lst)
