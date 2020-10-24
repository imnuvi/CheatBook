# this set has all repetition counts and multiple occourances

import re

# repetitions can be matched with { } brackets. The number within the brackets is the count and matches exactly that number of occourances.  [a-z]{3} matches all 3 letter words

# pattern for S
# S must be of length equal to 15.
# The first 10 characters should consist of letters(both lowercase and uppercase), or of even digits.
# The last 5 characters should consist of odd digits or whitespace characters.

Pattern_1 = r'^[a-zA-Z02468]{10}[13579\s]{5}$'
Test_String_1 = "aaAa2aaaaa13 57"    #true
Match_1 = re.findall(Pattern_1, Test_String_1)



# matching range of repetitions, to match any number of occourance between a range, {start,end} is used.  {3,5} matches 3 occourances 4 occourances or 5 occourances, {4,} matches four to any

# S should begin with 1 or 2 digits.
# After that, S should have 3 or more letters (both lowercase and uppercase).
# Then S should end with up to 3 "." symbol(s). You can end with 0 to 3 "." symbol(s), inclusively.

Pattern_2 = r'^\d{1,2}[a-zA-Z]{3,}\.{0,3}$'
Test_String_2 = "3threeormorealphabets."    #true
Match_2 = re.findall(Pattern_2, Test_String_2)



# matching 0 or more repetitions, can be done with * .   [a]* matches any number of "a" s

# S should begin with 2 or more digits.
# After that, S should have 0 or more lowercase letters.
# S should end with 0 or more uppercase letters

Pattern_3 = r'^\d{2,}[a-z]*[A-Z]*$'
Test_String_3 = "14"    #true
Match_3 = re.findall(Pattern_3, Test_String_3)



# one or more repetitions are matched with + .  \d* matches one or more digits

# S should begin with  or more digits.
# After that, S should have 1 or more uppercase letters.
# S should end with 1 or more lowercase letters.

Pattern_4 = r'^\d+[A-Z]+[a-z]+$'
Test_String_4 = "1Qa"    #true
Match_4 = re.findall(Pattern_3, Test_String_4)
