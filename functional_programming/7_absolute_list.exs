# given a list convert all values to their absolute values

IO.stream(:stdio, :line)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&(abs(&1)))
    |> Enum.each(&(IO.puts/1))
