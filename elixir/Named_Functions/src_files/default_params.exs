defmodule Default do
  def defunc(p1, p2 \\ 55, p3 \\ 3, p4) do
    IO.puts("YOU gave #{p1} #{p2} #{p3} #{p4}")
  end

  def tests(p1, p2, p3) do
    IO.puts("This test yields #{p1} #{p2} #{p3}")
  end
end
