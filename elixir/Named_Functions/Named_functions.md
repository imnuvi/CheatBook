Once code grows beyond a point, it needs to be structured and named for ease of access. code is broken down into named functions and arranged in modules. Named functions NEED to be written inside modules.


in [times.exs](./times.exs) we have defined a module called Times and a single function double which doubles the value thats given. since the number of arguments ( its arity ) is a part of the way we identify functions, it is written as double/1


compile the file with c command. Notice that arguments are strings and need to be given with double quotes


Now the function can be called with module.function. So Times.double(55) will give 110



in elixir the arity(number of arguments) is important. two functions with same name but different arguments are considered absolutely different funcitons. never use the same name for functions that do different things.




The do...end is one way of grouping expression. But its not the underlying syntax. The underlying syntax looks like <code>def double(n), do: n * 2 </code>

multiple lines are grouped with parantheses.


<code>def greet(name, greeting) do: (<br>
  IO.puts greeting<br>
  IO.puts  "Howre you doing #{name}"<br>
  )</code>



The first syntax is just syntactic sugar, and is enough.


<h3>Function calls and pattern matching</h3>

Just like with anonymous functions with multiple bodies, named functions use the same pattern matching technique to match from multiple definitions of the function. When a function is called, elixir tries matching the argument list provided with the argument types defined and checks to see if it matches.(all funcitons must have same number of arguments( arity )), Just like how we did fizz buzz. check out the anonymous functions file.


<h3>Guard clauses</h3>

We have used pattern matching to choose which function to execute. But what is we need to distinguish types or on the values of the arguments. Here we use guard clauses. These are attached to a function with the "when". elixir first matches and then executes the when predicates and executes the function if any one of the predicates is true




In our factorial function, if we give a negative argument, the number will never become 0, so if we give a guard clause which checks if a negative number is present nothing will match and so negative numbers will throw error.



<h5>Guard clause limitations</h5>

<ul>
  <li>comparison operators: ==, !=, ===, !==, >=, <=, >, < </li>
  <li>boolean: and, or, not (|| and && not allowed)</li>
  <li>arithmetic: +, -, *, /</li>
  <li>join: <>, ++ </li>
  <li>the <code>in</code> operator</li>
  <li>type check functions: these are built in erlang functions that return true if the argument is given type:
  is_atom, is_binary, is_bitstring, is_boolean, is_exception, is_float, is_integer, is_list, is_map, is_number, is_pid, is_port, is_record, is_reference, is_tuple</li>
  <li>other built in functions that return values:  abs(number), bit_size(bytestring), div(number,number), elem(tuple,n), float(term), hd(list), length(list), node(), node(pid|ref|port), rem(number,number), round(number), self(), tl(list), trunc(number), tuple_size(tuple)</li>
</ul>




<h3>Default Parameters<h3>

Default parameters are given with the <code>arg_name \\ default_value</code> syntax. Now elixir is weird. If you have four required parameters and two middle ones are defaulted (p1, p2 \\ 5, p3 \\ 4, p4) and you just give two values to the function,(lets say 10 and 20), elixir will match p1 as 10 and p4 as 20. p2 and p3 assume their default values. So be careful when using the default values. Better frame the function such that default values are at the end of the argument list. If the number of given arguments is greater than required, then the default arguments are overrided.






<!--  -->
