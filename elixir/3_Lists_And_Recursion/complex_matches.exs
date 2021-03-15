defmodule Complex do

  # this matches nested lists with their second element as 5
  def match_5( [  ] ), do: []
  def match_5( [ [time, 5, date, temperature] | tail ] ) do
    [ [ time, 5, date, temperature ] | match_5(tail) ]
  end
  def match_5( [ _ | tail ] ) do
    match_5(tail)
  end
end
