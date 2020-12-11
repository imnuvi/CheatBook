# a = r'^[a-zA-Z]{1}[a-zA-Z0-9\-.,_]*@[a-zA-Z]+\.[a-zA-Z]{1,3}$'
# a = r'^[a-zA-Z]'


import re
a = r'[a-z]*'

b = "Sathish"

print(re.findall(a,b))
