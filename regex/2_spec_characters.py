# this set includes matching character ranges and multiple options.

import re


# matching a character from a set is done with square brackets. it matches any value in between the brackets. eg [1ax7]  matches 1, a or x or 7.

# find pattern such that
# length is 6
# First character: 1, 2 or 3
# Second character: 1, 2 or 0
# Third character: x, s or 0
# Fourth character: 3, 0 , A or a
# Fifth character: x, s or u
# Sixth character: . or ,

Pattern_1 = r'$[123][120][xs0][30Aa][xsu][.,]$'
Test_String_1 = "12xAu,"    #true
Test_String_1_1 = "2003x."     #true
Test_String_1_2 = "2003x...."   #false
Match_1 = re.findall(Pattern_1, Test_String_1)



# excluding character values from a list is done usin ^ within square brackets

# Find pattern with length 6
# First character should not be a digit.
# Second character should not be a lowercase vowel ( a, e, i, o , u ).
# Third character should not be b, c, D or F.
# Fourth character should not be a whitespace character ( \r, \n, \t, \f or <space> ).
# Fifth character should not be a uppercase vowel (  A E I O U ).
# Sixth character should not be a . or , symbol.

Pattern_2 = r'^[123][120][xs0][30Aa][xsu][.,]$'
Test_String_2 = "12xAu,"    #true
Match_2 = re.findall(Pattern_2, Test_String_2)



# a range of characters can be given with the - character, within square brackets.  [a-z] means all alphabets from a to z

# word length greater than or equal to 5
# The first character must be a lowercase English alphabetic character.
# The second character must be a positive digit. Note that we consider zero to be neither positive nor negative.
# The third character must not be a lowercase English alphabetic character.
# The fourth character must not be an uppercase English alphabetic character.
# The fifth character must be an uppercase English alphabetic character.


Pattern_3 = r'^[a-z][1-9][^a-z][^A-Z][A-z].*'
Test_String_3 = "z9$?ZWe"    #true
Test_String_3 = "h4CkRRRR"    #true
Match_3 = re.findall(Pattern_3, Test_String_3)
