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


# excluding character values from a list
