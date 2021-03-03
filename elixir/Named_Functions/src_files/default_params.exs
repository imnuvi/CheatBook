defmodule Default do
  def defunc(p1, p2 \\ 55, p3 \\ 3, p4) do
    IO.puts("YOU gave #{p1} #{p2} #{p3} #{p4}")
  end



  def correct_func(p1, p2 \\ 33)

  def correct_func(p1, p2) when is_number(p1) do
    IO.puts("first one is a number #{p1} and #{p2} is maybe default")
  end

  def correct_func(p1, p2) do
    IO.puts("This yields #{p1} #{p2} ")
  end


end
