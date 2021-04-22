Elixir comes with a number of types that act as collections. lists and dictionaries. there are also ranges, files, even functions that can be enumerated. we can also define our own.

All these collections share a trait in that they are iterable. Elixir provides us with two modules Enum and Stream. Anything that can be iterated in elixir uses the Enumerable protocol.

The Enum module will be mostly used. The Stream module is almost the same but iterates through stuff lazily( only calculating when needed ).

# Enum for processing collections

there are a lot of functions in Enum module, and a few are listed below

<br>
<br>

- `Enum.to_list(1..5)` converts any enumerable into a list
- `Enum.concat([1,2,3], ["A","b","c"])` concatenates both collections
- `Enum.map([1,2,3], &(&1 * &1))` map all elements after performing a function on each
- `Enum.at([1,2,3,4], 2)` gives the element at the index described
- `Enum.filter([1,2,3,4], &(&1 < 15))` filters all elements based on the given function. If the function returns true, it is retained, if it returns false it discards the element.
- `Enum.at([1,2,3,4], &(&1 > 3))` filters every element except those that match the function given.
- `Enum.sort([3,5,6,1,2,9], &(String.length(&1) <= String.length(&2)))` sorts the enumerable based on the function given. if function is true, it sorts else it keeps as is
- `Enum.max( [1,2,3,4] )` gives the maximum element of the list
- `Enum.max_by( ["hi","hello", "wow", "okay"], &(String.length/1) )` gives the max element based on the function given for the particular type
- `Enum.take( [1,2,3,4], 3 )` gives a new collection with just the first n elements given in the second parameter
- `Enum.take_every( [1,2,3,4], 2 )` selects every nth element( second here ) from the collection
- `Enum.take_while( [1,2,3,4], &(&1<4) )` selects every element that matches and returns true in the function given as second argument.
- `Enum.split( [1,2,3,4], 3 )` splits the collection into two at the index mentioned
- `Enum.split_while( [1,2,3,4], 3 )` splits the collection into two until the condition is satisfied
- `Enum.join( [1,2,3,4] )` joins the collection into a string
- `Enum.join( [1,2,3,4], " , " )` joins the collection with the second argument
- `Enum.all?( [1,2,3,4], &(&1 < 4) )` checks if all elements in the collection match the function
- `Enum.any?( [1,2,3,4], &(&1 < 4) )` checks if any of the elements in the collection match the function
- `Enum.member?( [1,2,3,4], 2 )` checks if second argument is part of the collection
- `Enum.zip( [1,2,3], [:a, :b, :c] )` gives a new list where the elements are paired with those in the second argument
- `Enum.with_index( [1,2,3] )` creates a list of sets with the second element as their index
- `Enum.reduce( [1,2,3,4], &(&1 + &2) )` reduces the enumerable into a single value based on the function

_the <- is syntax for generator and is used mostly with for. it means a range_

**deal a hand of cards**<br>
`import enum`<br>
`deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]`<br>
`deck |> shuffle |> take(20)` select 20 random cards from the deck<br>
`hands = deck |> shuffle |> chunk(13)` split the deck into random 13 chunks.

**Sorting**

when sorting with a custom function always use <= and not just < for the sort to be stable

## Enter Streams

Streams are a way of lazily calculating and enumerating collections, that we dont have a predefined size for. Lets say we want to find the largest word in an extremely large file, we would take all the words store them in an enumerable and then find the largest with the function. This takes a lot of memory and is suboptimal. We only need to calculate the value when required. So creating a stream and then processing the value would make much more sense.

**syntax** Streams can be given as input to other stream functions. IO.stream(:line) converts the io device into a stream which can then be processed.

One use case for using streams is when we are getting data from a server with enum we need to wait till all data is recieved. But with streams we can process the data as it arrives.( kinda like promises But weirder?)

### Infinite streams

The streams can also be infinite. lets say we create a stream of ten million numbers and just want the first five elements, with Enum module all ten million numbers are put in a list and then the first five elements are taken, which takes a lot of time. With enum the same can be done faster because only the first five elements are selected and so the other values are not even calculated `Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5)` This takes 8 seconds `Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)` This takes just a few milliseconds. Here the streams are bounded to a value. But they may also go on forever, and here we need function based streams. There are some wrapper functions to perform these. - Stream.cycle - Stream.repeatedly - Stream.iterate - Stream.unfold - Stream.resource

### Stream.cycle

This takes an enumerable and returns an infinite Stream containing elements of the enumerable. If it runs out of elements it cycles through the elements over and over again `Enum.take((Stream.cycle([1,2])),10)` creates a stream of 10 alternating ones and twos. we can also get to infinity.<br>
Streams are represented as functions when you inspect them.<br><br>

### Stream.repeatedly

This is a second order function and takes another function, and invokes the function every time a new value is needed. This function can be any function. `Stream.repeatedly(&:random.uniform/0) |> Enum.take(3)` takes a random value everytime and creates a stream of it.<br><br>

### Stream.iterate

This function takes two values a starting number and a function. every new value needed will be called from the previous value and the function performed on it. `Stream.iterate(2,&(&1*&1))` creates a stream where each number is 2 power n.<br><br>

### Stream.unfold

this is an extremely useful function(at least looks like.). It takes two parameters, a number and a function. The function returns a tuple of two values, one which is the value to be displayed, the other is the value to be sent to the next iteration. That means what is returned and what is sent next are different and can be manipulated. The syntax is Stream.unfold( state, fn state -> { stream_value, new_state } end) where the function syntax is crucial. `Stream.unfold( {0,1}, fn {v1,v2} -> { v1, {v1, v1+2} } end)`<br><br><br>
So what is happening here? we have the initial fibonacci values 0 and 1\. The value returned is 0\. the next time 1,0+1 is set as state and the value 1 is returned. next 1, 2 is set as state and it returns the 2 and so on generating the fibonacci numbers.

### Stream.resource

The resource function allows us to write custom streams from devices or collections. Say we need to implement a stream from database queries or write our own lazy file reading function, we can do it with stream.resource . It is a modification of the unfold function. It takes three parameters and all are functions.

- the first argument is a function that returns a resource( like file or database )
- the second argument is similar to second argument in unfold, where it takes a resource, returns a value and passes a new value for the next iteration. If the tuple returned has a value as the first value it continues, or if the first value is :halt, it stops the execution and performs the third parameter, which is
- the third argument is a function that is performed when all execution is done,( like file close ) basically deallocating the resource used.

### Stream personality

Streams are calculated when required asynchronously and so produce appropriate results each time it runs. Like in the timer function, whenever we call the stream through a pipe to Enum we get different values. Which is a useful property for asynchronocity.

In practice try using streams whenever you want to stop processing till data arrives or want to generate lots of data without generating them at once.

### The collectible protocol

the collectible protocol allows us to insert elements into a collection. But not all collections can be inserted to ( a range cannot be inserted to ). Easiest way to access the collectible protocol is with the Enum.into function.

This is opposite to the enumerable protocol where we can iterate over a collection.

### Comprehensions

Since we are going to use alot of mapping and filtering and giving a new output, there is a shortcut, which is the comprehension(kinda like list comprehension in python)

The idea of comprehensions is get all values in a collection, optionally filter each value, perform a function on the function and create a new collection with what exists.

syntax: `for generator... [,into: value], do: expression` `iex> for [1,2,3,4], x < 3, do: x*x`

there can be multiple generators. any variable matched is available in all the blocks. If we have two generators their operations are nested.

`x <- [1,2], y <- [5,6]` will run the comprehension with x=1,y=5 :: x=2,y=5 :: x=1,y=6 :: x=2,y=6

**also remember pattern matching everywhere**

Here is a bit of code that produces all ranges in the given tuples and gives a new list with those values

`iex> ranges = [{1,4}, {5,10}, {4,8}]`<br>
`iex> for {min,max} <- ranges, n <- min..max, do: n`

A filter is a predicate which sees if the value is worthy of being sent to the next iteration. if the value passes through, the function is done, else no value is put in the output.

<br>
<br>
comprehensions can be used for simple stuff like flipping the keys with values. here is one that flips keys and values in a keyword list( list with key value paired tuples where keys are atoms.) (( since we are inverting keyword lists, the values are also atoms in the example.)) remember the card generating function? It used Comprehensions

`iex> lst = [ {:name, :aang}, {:trial, :boiledinoil}, {:place, :kiyoshi}]`<br>
`iex> for {key, value} <- lst, do: {value, key}`

These comprehensions work on bits too. But with a slight change in the syntax. Here the generators are enclosed in "<<" and ">>"
