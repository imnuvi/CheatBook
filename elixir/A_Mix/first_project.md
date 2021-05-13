
Mix is a tool used for creating full fledged elixir applications.

The application we are going to build acts as a distributed key-value store. At the end we are going to build a client that can talk to all the nodes and send commands like CREATE, PUT, GET


for this we are going to use
- OTP - Open Telecom Platform which is a set of tools on erlang.
- Mix - Mix is a build tool that has tasks for creating managing and testing applications.
- ExUnit - a test unit based framework that ships with Elixir




I probably will have full learnings on the other repo.

I will add changes here( maybe )


the refernce to the mix docs is here https://hexdocs.pm/mix/Mix.html
the tutorial I followed is here https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html


I have the repository where I created the app at https://github.com/cosmoglint/mix_hex
The original source code by Jose valim is at https://github.com/josevalim/kv_umbrella







## Introduction
Creating a new project is done by using the `mix new` command

we will use

`mix new keyproject --module KeyProject` here the KeyProject is our project name and --module lets us specify the main module name of the project


you can run `mix help` for mix related commands



This creates some files that help us compile and run the project. The mix.exs file provides three functions

- project function returns the project configuration details ( name and other stuff. we can configure them )
- application function is used to generate the application file which we will run for the project.
- the deps function which tracks the dependencies for the file.

###Compilation



`mix compile` compiles the project and outputs a myproject.app file in the _build folder with the specifications defined in mix.exs
`iex -S mix` starts a new iex terminal session. you can also use the `iex>recompile()` function within iex to recompile the project if there are changes. it return :ok if changes were successfuly compiled of :noop if there are no changes.


Now mix also created a tests folder with two files. the my_project_test.exs file acs as the test file for the my_project.exs file.
the other file test_helper.exs file is the file that mix uses every time `mix test` is used


you can run a particular test by giving it as argument to the mix test command. This is useful when there is an error in a particular file and exunit gives us handy locations of which test is failing


The .formatter.exs files tells which files elixir needs to auto format. This maintains a consistent coding style within the project


### Environments
These help devs customize compilation and other options for specific scenarios.

mix understands
- :dev - mix compile and other development commands take advantage
- :test - used by mix test
- :prod - actual production environment.

the environement applies only to the current environment and the current environment can be found by the Mix.env in the mix.exs file

this is the same Mix.env which we have used in the :start_permanent option in the mix.exs file.
this :start_permanent option keeps the erlang VM running if the application supervision tree shuts down ( what are application trees? )
But this is not desired in test or dev environments because knowing where the bug is will be useful.



Mix defaults to the the :dev environment. the environment can be changed via the MIX_ENV variable.

`MIX_ENV=prod mix compile`







## Processes
Elixir code runs inside processes. each process is isolated from each other and state cannot be shared between processes(no mutation). These are not core processes or even threads. These are lightweight than both and a lot of processes(tens of thousands to hundreads of thousands) can by run at the same time. These processes maintain concurrency and fault proof ideology.

##### Spawn

This is an inbuilt function for starting a new process in elixir. It takes in a single argument, which is a function which it will execute in a separate process.

`iex>spawn(fn -> 1 + 2 end)`
`#PID<0.140.0>`

the process is likely dead because once a function is executed, the process dies. spawn returns the pid which can be used to identify proceses.

the program or the iex which runs is a process in itself and can be found the pid with the `self()` command.

to check if a process is alive use `Process.alive?(PID)` where Pid is the pid of our function.


*messages*
we can send messages to processes with the send function and recieve them with the recieve function. these are like js events.
send takes two parameters, the PID and the message, receive goes through the mailbox and gives the output if any of the clauses match. guards can also be given to recieve function.

`send(self(),{ :hello, "world"})`<br><br>
`recieve do`<br>
  `{ :hello, value } -> value`<br>
  `{ :nope, value } -> "not hello"`<br>
  `after`<br>
    `1_000 -> "nothing after 1s"`<br>
`end`

the flush/0 function is useful and prints all the messages in the mailbox

*Links*
mostly processes are linked in elixir. Generally when a normal process fails, the main process is not linked with the failed process and continues to run. But when the processes are linked, the failed process also fails the running process. this is called failure propagation. its done by Process.link/1 function. or you can spawn a new process linked with the current one with spawn_link. processes are separate in themselves, and so wont corrupt the state of other Processes. But links allow us to create a relationship with other processes or supervisors.


*Tasks*
Tasks are built on top of processes for better error reports and introspection.
We can use tasks and they will return a tuple of {:ok, pid} rather than just pid. This enables us to use tasks in supervision trees. task produces :async and :await.


*State*
state is data that needs to be accessed. the best way to store state is in processes that loop infinitely and wait for messages to occur and then send the messages. (more at https://elixir-lang.org/getting-started/processes.html#state)



*Agents*
If all we need from a process is to store state agents are perfect. start an agent with Agent.start_link(fn) where function sets the initial state of the state. this returns a tuple { :ok, <PID> }.
Agent has the following useful functions
- Agent.update/3 : first argument is the PID, second one is the function. the second argument function takes in the state of the agent itself and then the returned value is updated as the state. the third argument is the timeout, which is by default 5000
- Agent.get/3 : this function gets the state of the agent. first argument is the PId, second one is the function, this function also takes the current state as argument and can return it to us with the formatting or changes we need or if the same argument is returned the current state is returned. third argument is the timeout.
- Agent.stop/3 : This function stops the process thats running. first argument is the pid. the second one is the reason which is by default :normal. the third argument is timeout, by default :infity.





in the test file, we have async: true. use this only if the state change happens separately in order to avoid race conditions. Here the ExUnit.Case is responsible for testing the stuff and asserting the results. it provides some useful functions like test/2 macro.
Also make sure the module where you write the functions to test are .ex and not .exs( i dunno why I am researching it RIGHT now )
always give a documentation for any function you write with the @doc decorator(atleast I think its a decorator dont @ me). syntax for documentation is `@doc """ This function does this thing """`
