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




<h3>Default Parameters</h3>

Default parameters are given with the <code>arg_name \\ default_value</code> syntax. Now elixir is weird. If you have four required parameters and two middle ones are defaulted (p1, p2 \\ 5, p3 \\ 4, p4) and you just give two values to the function,(lets say 10 and 20), elixir will match p1 as 10 and p4 as 20. p2 and p3 assume their default values. So be careful when using the default values. Better frame the function such that default values are at the end of the argument list. If the number of given arguments is greater than required, then the default arguments are overrided.


Also mind the number of arguments you give. If you give too many arguments it wont match. also if you want to have different functions with different arguments, defaults can pose a problem when matching.


<code>
def func(p1, p2 \\ 2, p3 \\ 3, p4) do<br>
  IO.inspect [p1, p2, p3, p4]<br>
end<br>
def func(p1, p2) do<br>
  IO.inspect [p1, p2]<br>
end<br>
</code>
<br>

will produce an error because two arguments will always match the first one.






also sometimes multiple defaults will produce problems so just give a funtion head with the default and no body and it will always match


<code>
def func(p1, p2 \\ 123)<br>
def func(p1, p2) when is_list(p1) do<br>
  "You said #{p2} with a list"<br>
end<br>
def func(p1, p2) do<br>
  "You passed in #{p1} and #{p2}"<br>
end<br>
</code>



<h3>Private Functions</h3>

Private functions are functions that can only be called from within the module it is defined in. It is defined with the <code>defp</code> keyword. You can have multiple heads of private functions but you cannot have some public and others private.




<h3>The Pipe operator</h3>

The pipe operator is a syntax for chaining functions( like then in python. ) the |> is the syntax for piping.
It takes the value of the expression to the left of the pipe and sends it to the function on its right as the first argument.

eg. val |> f(a,b) is same as calling f(val,a,b)
<br>

list |> sales_tax(2013) |> prepare_filing  is same as

prepare_filing(sales_tax(list,2013))


the pipes can be split in separate  lines, but can also be chained in a single line


iex><code>(1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 < 40))</code><br>
<code>[1,4,9,16,25,36]</code>


Always use parantheses around function parameters.

Pipes help us write programs that follow the programs specs.



<!--  -->
