# some simple stuff here, as things get more complex ill add them in different files

import re



# find a specific word in a string (wikipedia is the word to find)

Pattern1 = r'wikipedia'
Test_String_1 = "https://wikipedia.org"
match1 = re.findall(Pattern_1, Test_String_1)


# find a word at the Start and end of string. ^ startswith,  $ endswith
# starting with "hi", ending with "goodnight"

#here . (fullstop) matches any character, * is for 0 or more occourances

Pattern2 = r'^hi.*'
Test_String_2 = "https://wikipedia.org"
match2 = re.findall(Pattern_2, Test_String_2)
