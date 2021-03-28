
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
<br>
the above syntax can only be used to edit existing keys. New keys cannot be added. for adding new keys Dict.put_new/3 needs to be used


<h6>Note:</h6>
remember the %{ a: "one", b: "two" } syntax only works if the keys are atoms. if they're not atoms, use the %{ "a" => "one", "b" => "two" }

<br>
<h3>Structs</h3>

If we want to have a generalised map, the general dict is sufficient. But elixir doesnt know if some particular keys are not allowed or just one type of keys are allowed( a typed map ). for this the Struct can be used. Structs are maps with fixed set of fields, default values for those fields and can be pattern matched by type as well as value(content).


a struct is basically a module that wraps a limited form of map. Its limited because the keys need to be atoms and dont have dict or access capabilities

the name of the module becomes the type of the map type. Inside the module use defstruct to define the maps characteristics.


<code>
defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end
</code>

<br>
<br>
here the type of the struct is Subscriber. the default values are given in defstruct. so calling s1 = %Subscriber{} will create a subscriber map with default values.
values can be accessed with the dot notation. <code>s1.paid</code> will yield false.


you cannot define a map with fields other than those in defstruct.

updates happen the same way for normal dict. so s2 = %Subscriber{ s1 | paid: true} is how we update a Struct.


sructs are wrapped in a module in order to implement struct specific functions and behaviour.





<h5>different ways to access stucts.</h5>

unlike maps we cannot access structs with the square bracket notation. only the dot notation can be used. this is because maps use the Access protocol while structs do not. Hovewer this can be added with the Access directive like so,
<code>
defmodule Attendee do
  @derive Access
  defstruct name: "", over_18: false
end
</code>


now this can be accessed as A1[:over_18]



<h3>Nested Dictionaries</h3>

Dictionaries allow us to associate various keys with values. But these values themselves can also be dictionaries. Say a person can be a dictionary with multiple attributes, and can have a pet which can also be a dictionary effectively nesting dictionaries.


This will have code in my_map.exs file, with a nested person along with the pet struct.


<b>Note</b> when using the key => value syntax for assigning the struct or a map, you need to specify if the key is an atom  or not with : like <code>:my_key => 55</code>

<b>put_in</b> this method can be used to update a value within a nested struct. like <code>report = %{ owner: %{ name: "Dave", company: "Pragmatic" }, severity: 1}</code><br>
<code>put_in(report.owner.company, "fast car company")</code>
<br>
<br>
<b>update_in</b> this method is similar to put_in but can be given a function as second argument instead of a value and the function will be performed on the key-value. like <code>report = %{ owner: %{ name: "Dave", company: "Pragmatic" }, severity: 1}</code><br>
<code>put_in(report.owner.name, &("mr. " <> &1))</code>

The nested functions put_in and update_in make use of the Access protocol. So if we have a dict or a map inside a struct it can be accessed within the struct nested with square bracket access notation.

<code>put_in(report[:owner][:company], "PragProg")</code>

<h3>Dynamic(Runtime) nested accessors</h3>

The nested accessors so far are macros(check https://elixir-lang.org/getting-started/meta/macros.html) and hence have some limitation on the number of parameters that can be sent and these keys cannot be sent to other functions. so when a list containing some keys are sent to these functions, they call them as functions instead of macros. these allow us to dynamically manipulate the keys at runtime.


![function image](../images/map_functions.png)


Cool stuff that happens in dynamic accessors in get_in and get_and_update_in is when we give a function as a parameter in the key list, all keys for which the values match in the function are returned.

<h3>Sets</h3>

sets(HashSets) can be used to store data and then access them in constant time.

<code>s1 = Enum.into 1..5 HashSet.new</code>

functions supported with sets are
- Set.member?(setname, value)
- Set.union(set1,set2)
- Set.difference(set1,set2)
- Set.intersection(set1,set2)







<!--  -->
