
defmodule MyMap do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end


defmodule HotelRoom do
  def book(%{ name: name, height: height })
  when height > 1.7 do
    IO.puts "Need an extra long bed for #{name}"
  end

  def book( %{ name: name, height: height } )
  when height < 1.3 do
    IO.puts "Keep the switches low for #{name}"
  end

  def book(person) do
    IO.puts("Normal bed for this customer #{person.name}")
  end
end


defmodule Subscriber do
  defstruct [name: "", paid: false, over_18: true]
end


defmodule Attendee do
  defstruct [name: "", paid: false, over_18: true, present: false]

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def is_present(attendee = %Attendee{}) do
    %Attendee{ attendee | present: true }
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts("Print very cheap badge for #{name}")
  end

  def print_vip_badge(%Attendee{}) do
    IO.puts("You dont have a name?")
  end
end



people = [
  %{ name: "Grumpy", height: 1.94 },
  %{ name: "Dave", height: 1.88 },
  %{ name: "John", height: 1.32 },
  %{ name: "Fan", height: 1.1 },
  %{ name: "Larry", height: 1.75 }
]

for person = %{ height: height } <- people,
height > 1.5,
do: IO.inspect(person)



my_numbers = %{ a: 1, b: 2, c: 3, d: 4 }

new_numbers = %{ my_numbers | b: "two", c: :three }

# numbers2 = %{ new_numbers | x: "five" } This produces error because this syntax can only change keys not add them

IO.puts(inspect new_numbers)
# IO.puts(inspect numbers2)
