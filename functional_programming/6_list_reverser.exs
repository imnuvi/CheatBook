# given a list reverse it

IO.stream(:stdio, :line)
|> Enum.map(&String.trim/1)
|> Enum.reduce([], &([&1 | &2]))
|> Enum.each(&IO.puts/1)


#  my solution aliter

defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT

    def reverser([], ans), do: ans
    def reverser( [ head | tail ], ans ) do
        reverser(tail, [head | ans])
    end

    def main(vals) do
        Enum.each(reverser(vals, []), &IO.puts(&1))
    end
end

vals = String.split(IO.read(:stdio, :all))

Solution.main(vals)
