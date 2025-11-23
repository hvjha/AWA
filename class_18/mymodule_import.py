#All import at a time meand complete module 
'''
import mymodule

print(mymodule.greet("Harsh"))

print("addition:",mymodule.add(7,9))
print("substraction:",mymodule.sub(27,9))
print("multiplication:",mymodule.mul(7,9))
print("division:",mymodule.div(27,9))
'''

#Alternate way selective import 
'''
from mymodule import add
print("addition1:",add(17,19))
from mymodule import sub
print("substraction1:",sub(17,19))
from mymodule import mul
print("multiplication1:",mul(7,19))
from mymodule import div
print("division1:",div(17,9))
'''
#All import at a time meand complete module but selectively 
'''
from mymodule import add, sub, mul, div
print("addition2:",add(17,19))
print("substraction2:",sub(17,19))
print("multiplication2:",mul(7,19))
print("division2:",div(17,9))

'''
#we use this as 
'''
from mymodule import *
print("addition2':",add(17,19))
print("substraction2':",sub(17,19))
print("multiplication2':",mul(7,19))
print("division2':",div(17,9))

'''

#import complete module and use it as a alias
'''
import mymodule as m
print("addition3:",m.add(7,9))
print("substraction3:",m.sub(27,9))
print("multiplication3:",m.mul(7,9))
print("division3:",m.div(27,9))

'''

#print(dir(mymodule))
'''
import requests
response = requests.get("https://api.github.com")
print(response.status_code)

'''
import mypackage.module1
print(mypackage.module1.hello())