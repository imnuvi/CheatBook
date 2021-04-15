

Elixir comes with a number of types that act as collections. lists and dictionaries. there are also ranges, files, even functions that can be enumerated. we can also define our own.

All these collections share a trait in that they are iterable. Elixir provides us with two modules Enum and Stream. Anything that can be iterated in elixir uses the Enumerable protocol.

The Enum module will be mostly used. The Stream module is almost the same but iterates through stuff lazily( only calculating when needed ).


<h3>Enum for processing collections</h3>
there are a lot of functions in Enum module, and a few are listed below

<br><br>
<ul>
  <li><code>Enum.to_list(1..5)</code> converts any enumerable into a list</li>

  <li><code>Enum.concat([1,2,3], ["A","b","c"])</code> concatenates both collections</li>

  <li><code>Enum.map([1,2,3], &(&1 * &1))</code> map all elements after performing a function on each</li>

  <li><code>Enum.at([1,2,3,4], 2)</code> gives the element at the index described</li>

  <li><code>Enum.filter([1,2,3,4], &(&1 < 15))</code> filters all elements based on the given function. If the function returns true, it is retained, if it returns false it discards the element.</li>

  <li><code>Enum.at([1,2,3,4], &(&1 > 3))</code> filters every element except those that match the function given.</li>

  <li><code>Enum.sort([3,5,6,1,2,9], &(String.length(&1) <= String.length(&2)))</code> sorts the enumerable based on the function given. if function is true, it sorts else it keeps as is</li>

  <li><code>Enum.max( [1,2,3,4] )</code> gives the maximum element of the list</li>

  <li><code>Enum.max_by( ["hi","hello", "wow", "okay"], &(String.length/1) )</code> gives the max element based on the function given for the particular type</li>

  <li><code>Enum.take( [1,2,3,4], 3 )</code> gives a new collection with just the first n elements given in the second parameter</li>

  <li><code>Enum.take_every( [1,2,3,4], 2 )</code> selects every nth element( second here ) from the collection</li>

  <li><code>Enum.take_while( [1,2,3,4], &(&1<4) )</code> selects every element that matches and returns true in the function given as second argument.</li>

  <li><code>Enum.split( [1,2,3,4], 3 )</code> splits the collection into two at the index mentioned</li>

  <li><code>Enum.split_while( [1,2,3,4], 3 )</code> splits the collection into two until the condition is satisfied</li>

  <li><code>Enum.join( [1,2,3,4] )</code> joins the collection into a string </li>

  <li><code>Enum.join( [1,2,3,4], " , " )</code> joins the collection with the second argument</li>

  <li><code>Enum.all?( [1,2,3,4], &(&1 < 4) )</code> checks if all elements in the collection match the function</li>

  <li><code>Enum.any?( [1,2,3,4], &(&1 < 4) )</code> checks if any of the  elements in the collection match the function</li>

  <li><code>Enum.member?( [1,2,3,4], 2 )</code> checks if second argument is part of the collection</li>

  <li><code>Enum.zip( [1,2,3], [:a, :b, :c] )</code> gives a new list where the elements are paired with those in the second argument</li>

  <li><code>Enum.with_index( [1,2,3] )</code> creates a list of sets with the second element as their index</li>

  <li><code>Enum.reduce( [1,2,3,4], &(&1 + &2) )</code> reduces the enumerable into a single value based on the function</li>

</ul>

<i>the <- is syntax for generator and is used mostly with for. it means a range</i>

<b>deal a hand of cards</b><br>
<code>import enum</code><br>
<code>deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]</code><br>
<code>deck |> shuffle |> take(20)</code>  select 20 random cards from the deck<br>
<code>hands = deck |> shuffle |> chunk(13)</code> split the deck into random 13 chunks.


<b>Sorting</b>

when sorting with a custom function always use <= and not just < for the sort to be stable



<h2>Enter Streams</h2>

Streams are a way of lazily calculating and enumerating collections, that we dont have a predefined size for. Lets say we want to find the largest word in  an extremely large file, we would take all the words store them in an enumerable and then find the largest with the function. This takes a lot of memory and is suboptimal. We only need to calculate the value when required. So creating a stream and then processing the value would make much more sense.

<b>syntax</b>
Streams can be given as input to other stream functions.
IO.stream(:line) converts the io device into a stream which can then be processed.

One use case for using streams is when we are getting data from a server with enum we need to wait till all data is recieved. But with streams we can process the data as it arrives.( kinda like promises But weirder?)



<h4>Infinite streams</h4>
The streams can also be infinite. lets say we create a stream of ten million numbers and just want the first five elements, with Enum module all ten million numbers are put in a list and then the first five elements are taken, which takes a lot of time. With enum the same can be done faster because only the first five elements are selected and so the other values are not even calculated

<code>Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5)</code> This takes 8 seconds
<code>Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)</code> This takes just a few milliseconds.


Here the streams are bounded to a value. But they may also go on forever, and here we need function based streams.

There are some wrapper functions to perform these.

- Stream.cycle
- Stream.repeatedly
- Stream.iterate
- Stream.unfold
- Stream.resource


<h4>Stream.cycle</h4>
This takes an enumerable and returns an infinite Stream containing elements of the enumerable. If it runs out of elements it cycles through the elements over and over again

<code>Enum.take((Stream.cycle([1,2])),10)</code> creates a stream of 10 alternating ones and twos. we can also get to infinity.

<br>
Streams are represented as functions when you inspect them.

<br>
<br>

<h4>Stream.repeatedly</h4>
This is a second order function and takes another function, and invokes the function every time a new value is needed.
This function can be any function.


<code>Stream.repeatedly(&:random.uniform/0) |> Enum.take(3)</code> takes a random value everytime and creates a stream of it.

<br>
<br>

<h4>Stream.iterate</h4>
This function takes two values a starting number and a function. every new value needed will be called from the previous value and the function performed on it.

<code>Stream.iterate(2,&(&1*&1))</code> creates a stream where each number is 2 power n.

<br>
<br>

<h4>Stream.unfold</h4>
this is an extremely useful function(at least looks like.). It takes two parameters, a number and a function. The function returns a tuple of two values, one which is the value to be displayed, the other is the value to be sent to the next iteration. That means what is returned and what is sent next are different and can be manipulated.

The syntax is Stream.unfold( state, fn state -> { stream_value, new_state } end) where the function syntax is crucial.

<code>Stream.unfold( {0,1}, fn {v1,v2} -> { v1, {v1, v1+2} } end)</code><br>
<br>
<br>

So what is happening here?  we have the initial fibonacci values 0 and 1. The value returned is 0. the next time 1,0+1 is set as state and the value 1 is returned. next 1, 2 is set as state and it returns the 2 and so on generating the fibonacci numbers.
