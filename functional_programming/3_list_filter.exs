# given a list filter out the values that are less that a particular given value




defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def main(n, lst) do
        ans = Enum.filter(lst, &(&1 < n))
        Enum.each(ans, &(IO.puts(&1)))
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
