This is my progress through learning elixir and functional programming



<h1>Getting Started</h1>

1. To run interactive shell <code>iex</code>
 - type <code>h()</code> for help instructions
 - type <code>h(function)</code> for help about that particular function
 - the /0, /1 tells us how many arguments are required by the helper. this is true for any error statement and anywhere a / is used
 - this is just like any other shell (irb, python3)
2. iex configuration file is the .iex.exs file in the home directory. Any elixir code you want when staring an interactive terminal can be put in this file and it will be executed when starting a new iex terminal
3. there are two types of elixir files _.ex_ and _.exs_ . The .ex are to be compiled and run(like cpp) whereas .exs files are like script files(like in python)
 - to run a an elixir file just type <code>elixir [file_name.exs]</code>
 - to compile and run we use the "c" command within the iex shell. <code>c "hello_world.exs"</code>
 - the last line gives the return value of the file if theres any. If no return value an empty array is returned


<h2>Basic Concepts</h2>

<h4>Matching</h4>
<p>Elixir doesnt actually assign values like in other languages. It matches whats on the left to whats on the right. say <code>a = 1</code> actually tries to match the variable a to 1. This is done by assigning a the value 1.
<code>thelist = [1,2,3]</code> and then <code>[a,b,c] = thelist</code> matches. but <code>[a,5,c] = thelist</code> doenst match because 5 is defined and cannot be matched to 2</p>


<p>consider elixirs "=" like the equal to in algebra say "x = 2a + y" doesnt assign the value of "2a + y" to "x" but instead asserts that value of "x" is equal to "2a + y" thats it. and you can find the value of "x" if you know "a" and "y" and vice versa</p>

- <b>ignoring</b>  underscores( _ ) can be used to match any pattern. The value is then discarded so <code>[a,_,c] = [1,5,4]</code> is useful if the second variable is not needed
- <b>Once</b> Bindings only happen once in a match. <code>[a,a,c] = [1,1,4]</code> matches, but <code>[a,a,c] = [1,5,4]</code> doesnt because a is already matched to 1.
- <b>Forcing</b>  older values of a vaiable can be done with  carat( ^ ) before the variable. <code>[^a,b,c] = [5,5,5]</code> Throws an error but assigns b and c without assigning for a.

<h4>Immutability</h4>
<p>Immutability means the state of a data never changes even when multiple functions are run on it. This is in contrast to object oriented programming where a single list given can be mutated ( say list list[1] = 5 or something.) This is bad because while multiple threads because every thread could be altering data that other processes require.</p>
<br>
<p>So the solution is to keep the data immutable and access it whenever necessary. This is done by duplicating the data and then changing it. This might look like a lot of storage would be required for the program. But, Elixir handles this. for example, lets say we have a list <code>list1 = [1,2,3]</code> Now if we want a new list with the number 4 at the front we just say <code>list2 = [ 4 | list1]</code>. now this looks like code duplication, but since elixir knows all data is immutable, it just references the list 1 we created and adds a four before it in list2. Now this means with the help of a bit more space we essentially created a new list with 4 in the front( Neat )   <br><b>Note :</b> This format of <code>list = [ head | tail ]</code> is a type of list formatting which we will see later</p>

<h4>garbage collection</h4>
<p> Garbage collection in elixir happens differently. the data is divided among the processes and each process has its own heap and so separate garbage collection for those heaps happens faster(since theyre small). If a process terminates without reaching the max heap size, then there is no need for garbage collection for that process</p>


<h4>coding with immutability</h4>
<p>we never directly change a value, and every function returns a value, Always. So for example if we want to lowercase a string we dont call <i>mystring.lowercase</i> but we call <code>newstring = String.downcase(mystring)</code></p>





<!--  -->
