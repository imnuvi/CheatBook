# given a string search for all " && " and replace them with " and " and " || " with " or "

import re


x = """if a + b > 0 && a - b < 0:
    start()
elif a*b > 10 || a/b < 1:
    stop()
print set(list(a)) | set(list(b))  """


while re.search(r'\s{1}&&\s{1}',x):
    x = re.sub(r'\s{1}&&\s{1}', " and ", x)
while re.search(r'\s{1}\|\|\s{1}',x):
    x = re.sub("\s{1}\|\|\s{1}", " or ", x)
print(x)
