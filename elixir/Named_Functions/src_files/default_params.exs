defmodule Default do
  def func(p1, p2 \\ 55, p3 \\ 3, p4) do
    IO.puts("YOU gave #{p1} #{p2} #{p3} #{p4}")
  end
end
