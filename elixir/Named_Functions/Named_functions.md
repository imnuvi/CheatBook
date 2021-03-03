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
  <li></li>
</ul>





<!--  -->
