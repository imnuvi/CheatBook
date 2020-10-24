# this contains regex for capturing matches and grouping matches


import re


# word boundaries are useful to match words without any non word characters, alphanumerics within the /b  /b are matched.    refer "https://stackoverflow.com/a/50634830"

# Your task is to write a regex which will match word starting with vowel (a,e,i,o, u, A, E, I , O or U).
# The matched word can be of any length. The matched word should consist of letters (lowercase and uppercase both) only.
# The matched word must start and end with a word boundary.

Pattern_1 = r'\b[aeiouAEIOU][a-zA-Z]*\b'
Test_String_1 = "Found Any match?"    #this matches all three words, because the boundries are as |Found| |Any| |match|?
Match_1 = re.findall(Pattern_1, Test_String_1)



# capturing and non capturing groups. a pattern can be captured and then used again in the replacement of value.  this can be done with ([a-z])  captures all alphabets and stores them which can later be used with $1, non capturing is done with (?:)
    # check "https://stackoverflow.com/a/3513858"

# word should have 3 or more consecutive repetitions of ok.

Pattern_2 = r'(ok){3,}'
Test_String_2 = "uhhh okokok chillout"    #true
Match_2 = re.findall(Pattern_2, Test_String_2)



# alternative matching is used to match a single item out of several possibilities (or operator). this is done with the line operator inside a group.  (bob|kevin|stuart) matches bob , kevin or stuart

# S must start with Mr., Mrs., Ms., Dr. or Er..
# The rest of the string must contain only one or more English alphabetic letters (upper and lowercase).

Pattern_3 = "^(Mr\.|Mrs\.|Ms\.|Dr\.|Er\.)[a-zA-Z]+$"
alt_pattern_3 = "^(Mr?s | [MDE]r)\.[a-zA-Z]+$"  #this is a clever ass way where ? either matches what comes after or doesnt
Test_String_2 = "uhhh okokok chillout"    #true
Match_2 = re.findall(Pattern_2, Test_String_2)

print(Match_2)
