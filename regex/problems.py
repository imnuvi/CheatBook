# problems in regex

import re


# Number can start with +, - or . symbol.
# +4.50
# -1.0
# .5
# -.7
# +.4


Pattern_1 = r'^([+-]{0,1}?[0-9]*)\.[0-9]+$'
Test_Strings =  ["4", "4.0O0", "-1.00", "+4.54", "1.414", "+.5486468", "0.5.0" "1+1.0"] #true

for i in range(len(Test_Strings)):
    Match = re.findall(Pattern_1, Test_Strings[i])
    print(Match)
