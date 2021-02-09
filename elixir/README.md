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
