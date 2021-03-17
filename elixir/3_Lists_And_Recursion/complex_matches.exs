defmodule Complex do

  # this matches nested lists with their second element as 5
  def match_5( [  ] ), do: []
  def match_5( [ [time, 5, date, temperature] | tail ] ) do
    [ [ time, 5, date, temperature ] | match_5(tail) ]
  end
  def match_5( [ _ | tail ] ) do
    match_5(tail)
  end


  # this takes another argument which matches the particular target location
  def for_location( [], target_loc ), do: []
  def for_location( [ head = [ _, target_loc, _, _ ] | tail ] , target_loc ) do
    [ head | for_location( tail, target_loc ) ]
  end
  def for_location( [ _ | tail ], target_loc ), do: for_location(tail, target_loc)

end
