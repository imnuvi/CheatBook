
A dictionary is a datatype which relates keys with values.

there are multiple implementations of dictionaries.

- Maps
- Keyword lists
- HashDict
- Keyword ( module with special implementation to store functions and program options )
- Set ( module which implements sets )


<h3>Which to use?</h3>

- More than one entry with same key - Keyword
- elements are ordered - Keyword
- need to pattern match - map
- more than a hundred entries - Hashmap



<h3>The Basics</h3>

maps and hashdicts both implement the Dict behaviour. The Keyword module also uses the implementation but with some modifications to accomodate multiple entries with same keys. Generally we use the Dict modules methods as this allows us to change the implementation between say Dict and HashDict.


We use Enum.into method to convert one collection into another ( say Map, or Dict )

this is done by calling <code>Enum.into my_collection, Map.new( or Dict.new, HashDict.new )</code>


view documentation here <link>https://hexdocs.pm/elixir/Keyword.html</link>


<h3>pattern matching</h3>

pattern matches happens like so.
<code>
iex> person = %{ name: "Dave", height: 1.88 }
%{height: 1.88, name: "Dave"}
iex> %{ name: a_name } = person
%{height: 1.88, name: "Dave"}
iex> a_name
"Dave"
</code>


here the a_name is matched with the "Dave" value and so the value of a_name variable is Davee



LOOPS:
assume we have a list of dictionaries that contain person name and their height. If we want to filter out people whose height is greater than a specified number, we can pattern match the elements to their height and inspect only if condition is satisfied.s




<h3>Binding values</h3>

values cannot be bound to values during pattern matching.

so %{ 2 => state } = %{ 1 => :ok, 2 => :error }

works but

%{ value => :ok } = %{ 1 => :ok, 2 => :error }

doesnt work




<h3>Updating a map</h3>


we updated lists by copying or adding a head of the list and traversing it. With maps we can edit, add or remove keys without traversing the entire map. Maps are also immutable so changing a map gives a new map.


best way to update a map is with the syntax.
<br>
<br>
<code>new_map = %{ old_map | key => value, ... }</code>

this creates a new map which has the values to the right of the pipe updated
