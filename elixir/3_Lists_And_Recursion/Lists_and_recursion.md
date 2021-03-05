Conventionally our minds are programmed to <i><b>Iterate</b></i> over lists. But here we will see that <i><b>recursion</b></i> is the absolute best solution.


<h3>Recursive definition</h3>

We already saw that a list can either be empty or have two elements head or tail. the head can be a value and the tail in itself is another list.


empty list is represented as []. for arguments sake lets say we can split the head and tail with a pipe |.
now the simple list [3] can be written as [ 3 | [] ].


Now if we extend the list with a value 2,
the list becomes [ 2 | [ 3 | [] ] ]

The full list can be written as  [ 1 | [ 2 | [ 3 | [] ] ] ]


Now we have absolutely defined the full list recursively. 
