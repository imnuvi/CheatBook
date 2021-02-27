Functions are created with fn keyword

<code>
fn
  parameter-list -> body
  parameter-list -> body ...
end
</code>


These functions can be passed as value for other functions or assigned to variables.

The implementation follows the arrow syntax. the elems before the arrow are parameters and after the arrow are executed after.
in order to call a function we use dot syntax, and parameters are given between the parantheses.

If there are no need for arguments they need not be given. But empty parameter brackets should be used for calling the function.



<h3>Multiple Bodies</h3>
single function can be used for different implementations based on the argument types and values passed. but number of arguments must remain the same.
A simple way to do this is with pattern matching. A file opened returns :ok atom if successful but returns an error if the file doesnt exist. This can be used to write a file opening function.<br>
iex><code>open_file = fn</code><br>
...><code>  {:ok, file} -> "Read data: #{IO.read(file, :line)}"</code><br>
...><code>  {_, error} -> "Error occoured: #{:file.format_error(error)}"</code><br>
...><code>end</code><br>



<h3>Functions can return functions</h3>

Functions can be nested such that a function actually returns another function.


iex><code>fun1 = fn -> fn -> "hello Im inner" end end</code>
<code>#Function<12.17052888 in :erl_eval.expr/5></code><br>
iex><code>fun1.()</code><br>
<code>#Function<12.17052888 in :erl_eval.expr/5></code><br>
iex><code>fun1.().()</code><br>
<code>hello im inner</code><br>
<br>



<h3>Function scopes</h3>

In the previous example, We say a nested inner function. This inner function has access to variables in the outer function

iex><code>fun2 = fn name -> ( fn -> "hello Im #{name}" )  end end</code>
<code>#Function<12.17052888 in :erl_eval.expr/5></code><br>
iex><code>dave_greeter = fun2.("Dave")</code><br>
<code>#Function<12.17052888 in :erl_eval.expr/5></code><br>
iex><code>dave_greeter.()</code><br>
<code>hello im Dave</code><br>
<br>




<h3>Parameterized functions</h3>

We can use inner and outer functions like decorators with both functions taking a parameter. For example<br>
iex><code>mult_n = fn n -> (fn value -> n * value end) end</code><br>
Function<12.17052888 in :erl_eval.expr/5><br>
iex><code>mult_5 = mult_n.(5)</code><br>
Function<12.17052888 in :erl_eval.expr/5><br>
iex><code>mult_2 = mult_n.(2)</code><br>
Function<12.17052888 in :erl_eval.expr/5><br>
iex><code>mult_5.(90)</code><br>
450<br>
iex><code>mult_2.(44)</code><br>
88<br>
<br>



<h3>Passing functions as arguments</h3>

functions are just values and can be passed into other functions<br>

iex><code>times_2 = fn n -> n * 2 end</code><br>
Function<12.17052888 in :erl_eval.expr/5><br>
iex><code>apply = fn (func, value) -> func.(value) end</code><br>
Function<12.17052888 in :erl_eval.expr/5><br>
iex><code>apply.(times_2,6)</code><br>
12<br>
<br>



<h3>Higher order functions</h3>

The capability to pass functions as arguments will be used everywhere. any function that takes another function as argument is called a higher order function.
enum.map is one such higher order function which takes an enumerable object and applies the function to every element in the enum

<br>

iex><code>test_list = [1, 2, 3, 4, 7, 90]</code><br>
[1, 2, 3, 4, 7, 90]<br>
iex><code>Enum.map(test_list, fn x -> x * 2 end )</code><br>
[2, 4, 6, 8, 14, 180]<br>
iex><code>Enum.map(test_list, fn x -> x * x end )</code><br>
[1, 4, 9, 16, 49, 8100]<br>
iex><code>Enum.map(test_list, fn x -> x > 5 end )</code><br>
[false, false, false, false, true, true]<br>
<br>


<h3>the & operator</h3>

creating short functions has a useful shortcut. The "&" converts everything that follows it into a function. the arguments are given as &1 &2 and so on.

iex><code>add_ten = &(&1 + 10)</code>  # is the same as add_ten = fn n -> n+10 end<br>
Function<6.17052888 in :erl_eval.expr/5><br>
iex><code>add_one.(44)</code>
54<br>
iex><code>square = &(&1 * &1)</code>
Function<6.17052888 in :erl_eval.expr/5><br>
iex><code>square.(8)</code>
64<br>
iex>speak = &(IO.puts(&1))
&IO.puts/1<br>
iex>speak.("hello")<br>
hello<br>
:ok<br>
<br>



Elixir is clever and knows if a function is predefined, and shows the actual reference to the function.


Arguments must be in correct order to work.<br>

iex><code>rnd = &(Float.round(&1,&2))</code><br>
&Float.round/2<br>
iex><code>rnd_1 = &(Float.round(&2,&1))</code><br>
Function<12.17052888 in :erl_eval.expr/5><br>

Here notice the order of arguments in first and second assignments. first one is in correct order so, it shows the erlang round function.


<br>
<br>

Theres another form of ampersand shortcut. Here you can give the name and number of parameters of the function. But since we still havent seen named functions we will just see the syntax.
Length is a function of the erlang vm.

<br>
iex><code>l = &length/1</code><br>
&:erlang.length/1<br>
iex><code>l.([1,2,3,4,5])</code><br>
5<br>



ampersand "&" is the easiest way to pass funcitons to other Functions

<br>

iex><code>Enum.map( [1, 2, 3 ,4], &(&1 + 1))</code><br>
[2,3,4,5]<br>
iex><code>Enum.map( [1, 2, 3 ,4], &(&1 * &1))</code><br>
[1,4,9,16]<br>
iex><code>Enum.map( [1, 2, 3 ,4], &(&1 < 3))</code><br>
[true,true,false,false]<br>


<br>

Functions are heart of elixir. They transform data from one form to another. We have seen anonymous functions that can be asssigned to variables. We are yet to see named functions.



<!--  -->
