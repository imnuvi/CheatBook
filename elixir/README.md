This is my progress through learning elixir and functional programming

Best place to access resources is <a>https://elixirschool.com/en/lessons/basics/basics/</a>


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
<p>we never directly change a value, and every function returns a value, Always. So for example if we want to lowercase a string we dont call <i>mystring.lowercase</i> but we call <code>newstring = String.downcase(mystring)</code>\ this keeps reminding us that all data returns and never mutates</p>


<h2>Elixir Basics</h2><p>(the language)</p>
<h4>Built in Types</h4>
  <ul>
    <li><h5>Value Types</h5></li>
      <ul>
        <li>arbitrary sized integers</li>
        <li>floating point numbers</li>
        <li>atoms</li>
        <li>ranges</li>
        <li>regular expressions</li>
      </ul>
    <li><h5>System Types</h5></li>
      <ul>
        <li>PIDs and ports</li>
        <li>References</li>
      </ul>
    <li><h5>System Types</h5></li>
      <ul>
        <li>PIDs and ports</li>
        <li>References</li>
      </ul>
    <li><h5>Collection Types</h5></li>
      <ul>
        <li>Tuples</li>
        <li>Lists</li>
        <li>Maps</li>
        <li>Binaries</li>
      </ul>
  </ul>

<h5>Value Types</h5>
<br>
 - Integers: These are basically numbers. An integer can be represented as binary, octal, decimal(these may contain underscores for every three digits 1_000_000), hexadecimal. There is no specific limit to the size of an integer.<br><br>
 - Floating-point: Written with a decimal point. must have atleast one digit before and after the decimal. eg. 1.0, 0.2456, 314159.01e-5, 0.2451e4<br><br>
 - Atoms: atom is a constant representing somethings name. These are written with leading semi-colon( : ), followed by words elixir operators, letters, digits and @, they can end with exclamation or question marks. Arbitrary atoms can be created with double quotes. e.g. valid atoms  :is_binary? , :<> , :=== , :"myfunc/3" , :frank . an atoms name is its value. two atoms with same name will always be equal doesnt matter where or when theyre created.<br><br>
 - Ranges: ranges are represented as <code>start..end</code>. these start and end can be any data type, but if you want to iterate over a range the ends must be integers<br><br>
 - Regular Expressions: regular expression literals are written as <code>~r{pattern}</code> or <code>~r{pattern}opts</code> opts are extra options to alter behaviour of the pattern. full docs here <a>https://hexdocs.pm/elixir/Regex.html</a>
 <ul>
  <li><code>f</code> force a pattern match at start of line for multiline</li>
  <li><code>g</code>support named groups</li>
  <li><code>i</code>makes matches case insensitive</li>
  <li><code>m</code> if string has multiple lines <code>^</code>matches start of a line and <code>$</code>. <code>\A and \Z</code>continue to match the end of these lines</li>
  <li><code>r</code>makes the code <i>reluctant</i> instead of greedy( the + and * are greedy and match as much as possible. but this flag makes them match as little as possible) </li>
  <li><code>s</code> allows " . " to match newlines as well</li>
  <li><code>u</code> allows unicode specific patttern matching</li>
  <li><code>x</code> extended mode. ignore whitespace and comments</li>
 </ul>

 Regular expressions can be manipulated with the Regex module<br>
 iex><code>Regex.scan ~r{[aeiou]}, "caterpillar"</code><br>
 [["a"],["e"],["i"],["a"]]<br>

 iex><code>Regex.replace ~r{[aeiou]}, "caterpillar", "h"</code><br>
 "chthrphllhr"
<br>
<br>
<h5>System Types</h5>
<br>
- PIDs and Ports: A PID is a reference to a process thats running either locally or remotely. Port is  a resource you're either reading or writing to. The PID of the current process is found by calling <code>self</code><br><br>
- References: a reference is a globally unique reference. No other reference will be equal to it. A reference is created with the <code>make_ref</code> function
<br>
<br>
<h5>Collection Types</h5>
<br>
- Tuples: these are the basic data storage in elixir. It is an ordered collection of values of any type. They offer a flexibility. If the number of elements to store exceed four, then its better to use maps or structs. tuples are written with elements in curly braces and commas separating them. eg.   <code>{ 1, :two, "three" }</code>, <code>{ :ok, "next" }</code><br>
tuples can be used in pattern Matching<br>
iex><code>{ status, count, action } = {:ok, 45, "next"}</code><br>
<code>{:ok, 45, "next"}</code><br>
Some functions return a tuple if the first element is the atom :ok if there were no errors. For example if we have a file and want to open it,
iex><code>{ :ok, file } = File.open("myfile")</code><br>
<code>{ :ok, #PID<0.39.0> }</code><br>
as the file was successfully opened we have :ok and the PID which is how we access the file.<br>
iex><code>{ :ok, file } = File.open("Nonexistentfile")</code><br>
<code>** (MatchError) no match of right hand side value: {:error, :enoent}
</code><br>
The Nonexistentfile was not opened and hence it returned a :error causing the match to fail.<br>
There are three functions that work on tuples only.<br>
- elem: <code>elem(mytuple,index)</code> returns the value<br>
- put_elem: <code>put_elem(mytuple,index,value)</code> returns a new tuple with the index replaced with the value<br>
- tuple_size: <code>tuple_size(mytuple)</code> returns an integer thats the size of the tuple


<br>
<br>
- Lists: Lists are not like lists in other languages although the syntax wants you to believe so. A list can either be empty or have a head and a tail. The tail can then be another list(empty or with a head and tail)( basically a list inception. ). They are easy to traverse linearly, but hard to access randomly( say if we want to get the fourth element, we need to traverse all the 3 previous elements. It is always cheap to get the head of a list and then get its tail.)<br>
lists are also immutable so once a list is created we cannot change it. But If we want to remove the head from a list, we dont have to copy the entire list. we just return the pointer to its tail and the head is gone( neat ).<br>
There are some list only functions<br>
iex> <code>[1, 2, 3] ++ [4, 5]</code><br>
<code>[1, 2, 3, 4, 5]</code><br>
iex> <code>[1, 2, 3, 4] -- [2, 3, 5, 6]</code><br>
<code>[1, 4]</code><br>
iex> <code>1 in [1, 2, 3, 4]</code><br>
<code>true</code><br>



<!--  -->
