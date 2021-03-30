

Elixir comes with a number of types that act as collections. lists and dictionaries. there are also ranges, files, even functions that can be enumerated. we can also define our own.

All these collections share a trait in that they are iterable. Elixir provides us with two modules Enum and Stream. Anything that can be iterated in elixir uses the Enumerable protocol.

The Enum module will be mostly used. The Stream module is almost the same but iterates through stuff lazily( only calculating when needed ).
