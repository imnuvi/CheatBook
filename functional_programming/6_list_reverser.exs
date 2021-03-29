# given a list reverse it

IO.stream(:stdio, :line)
|> Enum.map(&String.trim/1)
|> Enum.reduce([], &([&1 | &2]))
|> Enum.each(&IO.puts/1)
