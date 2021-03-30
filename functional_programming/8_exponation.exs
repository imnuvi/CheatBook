# The series expansion of e^x is given by:
# 1 + x^1 / 1! + x^2 / 2! + x^3 / 3!
# Evaluate e^x for given values of x by using the above expansion for the first  terms.



defmodule Factorial do
    def of(0), do: 1
    def of(n) when n > 0, do: n * of(n - 1)
end

defmodule Solution do

    def exponate(_value, 0), do: 1
    def exponate(value, iteration) do
        (:math.pow(value,iteration) / Factorial.of(iteration)) + (exponate(value, iteration-1))
    end
end


vals = IO.read(:stdio, :all)
    |> String.split

[ n | lst ] = vals

_ = n
    |> String.trim
    |> String.to_integer

_lst = lst
    |> Enum.map(&(String.trim/1))
    |> Enum.map(&String.to_float/1)
    |> Enum.map(&(Solution.exponate(&1, 9)))
    |> Enum.map(&(Float.round(&1, 4)))
    |> Enum.each(&IO.puts/1)
