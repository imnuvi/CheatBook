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

- <b>ignoring</b>  underscores( _ ) can be used to match any pattern. The value is then discarded so <code>[a,_,c] = [1,5,4]</code> is useful if the second variable is not needed
- <b>Once</b> Bindings only happen once in a match. <code>[a,a,c] = [1,1,4]</code> matches, but <code>[a,a,c] = [1,5,4]</code> doesnt because a is already matched to 1.
- <b>Forcing</b>  older values of a vaiable can be done with  carat( ^ ) before the variable. <code>[^a,b,c] = [5,5,5]</code> Throws an error but assigns b and c without assigning for a.
