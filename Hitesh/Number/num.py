x=2
y=3
z=4
B = (x+y)*z/y
# print(B)

# print(40 + 2.23)
# print(x,y,z)

c= y % 2
# print(c)

d = z**2
# print(d)

e= 100**2
# print(e)
f= 2**100
# print(f)
g=2**1000
# print(g)

result = 1/3.0
# print(result)

# print(1 <2<3)

# print (1<2 and 2<4)

# print(1==2 and 2<3)

import math
# print (math.floor(3.9))
# print(math.floor(-3.4))

# print(math.ceil(4.2))
# print(math.trunc(-2.8))
# print(math.trunc(2.4))

# print(2+1j)
# print((2+1j)*(3+1j))

# print(hex(64))
# print(oct(64))
# print(bin(64))
# print(0o20)
# print(0b1001)
# print(int('64',8))
# print(int('1000',2))

import random
print(random.randint(1,100))

l=[1,2,3,4,5,6,7,8,9]
print(random.choice(l))
otp_samp=random.sample(l,4)
print(otp_samp)
otp=random.choices(l,k=4)
print(otp)
otp_str= "".join(map(str,otp))
print(otp_str)




