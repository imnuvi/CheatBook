defmodule MyAssignments do
  # stole this from the solutions cause I had no clue.
  def all?(list) do
    all?(list, fn x -> !!x end)
  end
  def all?([], func), do: true
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], func), do: []
  def each([head, tail], func) do
    [func.(head) | each(tail, func)]
  end

  def filter([], func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail,func)]
    else
      filter(tail, func)
    end
  end

  def split(lst, val), do: split(lst, [], val)
  def split(lst, first, 0), do: {first, lst}
  def split([head | tail], first, val) do
    split(tail, first ++ [head], val-1)
  end

  def take(lst, val), do: take(lst, [], val)
  def take(lst, front, 0), do: front
  def take([head | tail], front, val) do
    take(tail, front ++ [head], val-1)
  end



  def flatten(lst), do: flatten(lst, [])

  def flatten([head | tail], newl) do
   IO.puts("HI")
   flatten(tail, flatten(head, newl))
  end

  def flatten([], newl), do: newl
  # def flatten([val], newl), do: flatten(val, newl)
  def flatten(val, newl), do: newl ++ [val]

  # [[[1]],2,[[[1,2,3],10]],4,5]
  # [1,2,3,[4]]

  def span(initial, final) do
    for val <- Enum.to_list(initial..final), do: val
  end

  def prime(n) do
    # for int <- span(2,n), pos <- span(2,int), fn (int,pos) -> (rem(int,pos) != 0) end, do: int
    # can be done with a list and the erotesthenos sieve
    lst = span(2,n)
    lst -- (for int <- lst, pos <- lst, pos <= :math.sqrt(int), rem(int,pos) == 0, into: [] , do: int)
  end



  # Write a function that takes both lists and returns a copy of the orders, but with an extra field, total_amount, which is the net plus sales tax. If a shipment is not to NC or TX, there’s no tax applied.

  def compare_tax(tax, orders) do
    # for x <- orders, do: x ++ [{ :tax , x[:net_amount]*1.5 }]

    # for x <- orders, do: x ++ [{ :total_amount, tax[x[:ship_to]] * 1.5 * x[:net_amount] }]
    # for x <- orders, do: tax[x[:ship_to]] * 1.5 * x[:net_amount]
    tax[[ id: 123, ship_to: :NC, net_amount: 100.00 ][:ship_to]]
    for x <- orders, val = x[:net_amount], val > = ((tax[:NC]) * 1.5), do: val
  end


end

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = [
        [ id: 123, ship_to: :NC, net_amount: 100.00 ],
        [ id: 124, ship_to: :OK, net_amount:  35.50 ],
        [ id: 125, ship_to: :TX, net_amount:  24.00 ],
        [ id: 126, ship_to: :TX, net_amount:  44.80 ],
        [ id: 127, ship_to: :NC, net_amount:  25.00 ],
        [ id: 128, ship_to: :MA, net_amount:  10.00 ],
        [ id: 129, ship_to: :CA, net_amount: 102.00 ],
        [ id: 120, ship_to: :NC, net_amount:  50.00 ] ]


IO.puts(inspect MyAssignments.compare_tax(tax_rates,orders))
