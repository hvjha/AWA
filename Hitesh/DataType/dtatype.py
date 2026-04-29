print(12+12)

print(2.5 * 5)

print(2 ** 10)
import random
print(random.choice([1,2,3,4,5]))

username = "Chaiaurcode"
print(len(username))
print(username[3])
print(username[1:4])
print(dir(username))

mylist = [1,2,3,4,['abc','bng','ghj','kjl'],8,8.9]
print(mylist)
print(mylist[4][2])

mydict = {'one':'lemon', 'two':'ginger','comic':'nagraj'}
print(mydict)
print(mydict['comic'])

myTup = (1,2,3,4,5)
print(myTup[1])

mylistone = [1,2,3]
mylistTwo = mylistone

mylistone = 'Harsh'
print(mylistTwo)
print(mylistone)

l1=[1,2,3]
l2=l1
print(l1)
print(l2)
l1[0]=44
print(l1)
print(l2)

p1=[1,2,3]
p2 = p1
p2=[1,2,3]
p1[1]=55
print(p1)
print(p2)

h1=[1,2,3]
h2=h1[:] 
# in this case h2 is not pointing to the same memory regerence 
# here h2 pointed the copy of h1 memory reference so when we change 
# any value in h1 h2 remain same
print(h1)
print(h2)
h1[0]=55
print(h1)
print(h2)

n= [1,2,3,4]
m = n
print (m==n)
print(m is n)

m = [1,2,3,4]
print(m == n)
print(m is n)