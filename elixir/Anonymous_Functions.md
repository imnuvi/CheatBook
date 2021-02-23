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
<code>#Function<12.17052888 in :erl_eval.expr/5></code>
iex><code>fun1.()</code>
<code>#Function<12.17052888 in :erl_eval.expr/5></code>
iex><code>fun1.().()</code>
<code>hello im inner</code>




<!--  -->
