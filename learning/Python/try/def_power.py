def power(x, n=2):
    p = 1
    while n > 0:
        n = n - 1
        p = p * x
    return p

print(power(5, 3))
print(power(5,))