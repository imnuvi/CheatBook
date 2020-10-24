# some simple stuff here, as things get more complex ill add them in different files

import re



# find a specific word in a string (wikipedia is the word to find)

Pattern_1 = r'wikipedia'
Test_String_1 = "https://wikipedia.org"
Match_1 = re.findall(Pattern_1, Test_String_1)



# find a word at the Start and end of string. ^ startswith,  $ endswith
# starting with "hi", ending with "goodnight"

#here . (fullstop) matches any character, * is for 0 or more occourances

Pattern_2 = r'^hi.*world$'
Test_String_2 = "hi to everyone in this wide world"
Match_2 = re.findall(Pattern_2, Test_String_2)



# whitespace and non-whitespace characters, can be matched with \s (all types of whitespace) and \S (non-whitespace)            (the "\" is an escape character, which we use later)
# match the pattern  XXsXXsXX
# Here, s denotes whitespace characters, and  X denotes non-white space characters.

# {} these brackets determine exact count of occourances just like "*"

Pattern_3 = r'\S{2}\s\S{2}\s\S{2}'
Test_String_3 = "DS 12 PM"
Match_3 = re.findall(Pattern_3, Test_String_3)


print(Match_3)


# word and non-word,  \w matches word character, \W matches non-word character
# match pattern wwwXwwwwwwXwww

Pattern_4 = r'\w{3}\W\w{6}\W\w{3}'
Test_String_4 = "www.harikr.com"
Match_4 = re.findall(Pattern_4, Test_String_4)



# matching tricky characters,  in order to match "." we need to escape it with \.
# to match "\"  escape it with \\
# match pattern  xxx.xxx.xxx.xxx
# where x is any digit and . is fullstop

Pattern_5 = r'\d{3}\.\d{3}\.\d{3}\.\d{3}'
Test_String_5 = "192.168.001.005"
Match_5 = re.findall(Pattern_5, Test_String_5)

print(Match_5)
