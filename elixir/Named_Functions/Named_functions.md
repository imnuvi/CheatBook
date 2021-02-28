Once code grows beyond a point, it needs to be structured and named for ease of access. code is broken down into named functions and arranged in modules. Named functions NEED to be written inside modules.


in [times.exs](./times.exs) we have defined a module called Times and a single function double which doubles the value thats given. since the number of arguments ( its arity ) is a part of the way we identify functions, it is written as double/1


compile the file with c command. Notice that arguments are strings and need to be given with double quotes


Now the function can be called with module.function. So Times.double(55) will give 110



in elixir the arity(number of arguments) is important. two functions with same name but different arguments are considered absolutely different funcitons. never use the same name for functions that do different things.




The do...end is one way of grouping expression. But its not the underlying syntax. The underlying syntax looks like <code>def double(n), do: n * 2 </code>

multiple lines are grouped with parantheses.
