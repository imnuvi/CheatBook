

import re


# matching a pattern is done with re.search() , matched groups with "()" can be accesses with .group() function. group(1) returns first group, groups() returns all groups

#Print the first occurrence of the repeating character. If there are no repeating characters, print -1.

Pattern_1 = r'([a-zA-Z0-9])\1+'
Test_String_1 = "..12345678910111213141516171820212223"

m = re.search(pat,Test_String_1)


print(m.group(1))
