What are types. In elixir types exist. But they have various idealogies. So  a primitive list is different from the type it represents. for example a list can be created with the square bracket syntax and can be deconstructed with the | operator. But theres another layer which is the List module where we have various operations that happen on primitive lists.

There is an intrinsic difference between a primitive list(the one we initialize) and the List module, which has various functions like List.last. Maps are also a primitive type and elixir offers a better library for working with maps.


An example. The Keyword list type is an Elixir module. But basically it is implemented as a list of tuples.

<code>options = [ {:width, 72}, {:style, "light"}, {:style, "print"} ]</code>

clearly this is a list. and

<code>List.last(options)</code><br>
<code>{:style, "light"}</code>

still works. also the Keyword module will work.

so the keyword which is essentially a dictionary like type also works.

<code>Keyword.get_values(options, :style)</code><br>
<code>["Light", "print"]</code><br>



So there are a lot of API's we can use on one particular data type we think.  In the above example we have access to the keyword type, the list type , the Enumerable type and the Collection type. Which is quite a lot of flexibility.
