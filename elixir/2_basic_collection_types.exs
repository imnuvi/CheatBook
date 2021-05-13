
# Tuples

my_tuple = { 1, :two, "three" }
tuple2 = { :ok, 55, "go" }
{ name, mark, prize } = { "ham", 50, :first }

{ :ok, file } = File.open("practice_data/data.txt")
file_tuple = { :ok, file }

IO.puts(inspect my_tuple)
IO.puts(inspect tuple2)
IO.puts(inspect file_tuple)
IO.puts(elem(my_tuple,1)) # prints the element at position 1

IO.puts(name)
IO.puts(prize)


# Lists

my_list = [1, "2", "Three"]
list_2 = ["one", "two", "three"]

IO.puts(inspect my_list)
IO.puts(inspect my_list ++ [4, 5])
IO.puts(hd(list_2)) # prints the head
IO.puts(inspect tl(list_2)) # prints the tail


# Keyword Lists

my_keyword_list = [ name: "dice", job: "rolling", character: "random"]
keyword_list2 = [ {:name, "dice"}, {:job, "rolling"}, {:character, "random"}]

IO.puts(inspect my_keyword_list)
IO.puts(inspect keyword_list2)


# Maps

my_map = %{ "TN" => "Tamil Nadu", "Kl" => "Kerala", "KN" => "Karnataka" }
scores = %{ 1 => "Topper", :two => "Runner", "Three" => "Trailer" }
games = %{ pop: "Awesome", proplay: "Coool", Script: "not that good" }

IO.puts(inspect my_map)
IO.puts(scores[1])
IO.puts(scores.two)
IO.puts(scores["Three"])
IO.puts(inspect games)
