

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

  <li><code>Enum.at([1,2,3,4], 2)</code> </li>

  <li><code>Enum.filter([1,2,3,4], &(&1 < 15))</code> filters all elements based on the given function. If the function returns true, it is retained, if it returns false it discards the element.</li>

</ul>
