
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
