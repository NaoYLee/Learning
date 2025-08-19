import re
n = 101
print(not re.match(r'^.?$|^(..+?)\1+$', '1'*n))