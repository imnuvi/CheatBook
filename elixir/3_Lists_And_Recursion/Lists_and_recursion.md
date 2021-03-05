Conventionally our minds are programmed to <i><b>Iterate</b></i> over lists. But here we will see that <i><b>recursion</b></i> is the absolute best solution.


<h3>Recursive definition</h3>

We already saw that a list can either be empty or have two elements head or tail. the head can be a value and the tail in itself is another list.


empty list is represented as []. for arguments sake lets say we can split the head and tail with a pipe |.
now the simple list [3] can be written as [ 3 | [] ].


Now if we extend the list with a value 2,
the list becomes [ 2 | [ 3 | [] ] ]

The full list can be written as  [ 1 | [ 2 | [ 3 | [] ] ] ]


Now we have absolutely defined the full list recursively.


This is valid elixir syntax and lists can be defined this way.

<h4>Pattern matching</h4>

This pipe syntax can be used with pattern matching for matching the tail value as an entire list. the normal list syntax can be used for usual value matching

<code>[ a, b, c] = [ 1, 2, 3]</code>  # a=1, b=2, c=3

<code>[ head | tail ] = [ 1, 2, 3]</code> # head = 1, tail = [ b, c ]


note:
Remember when debugging your code always inspect the list and convert it to a string for getting the actual list
