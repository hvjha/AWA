# class MyClass:
#     x=10
#     y="Harshita"

# p1 = MyClass()
# print(p1.y)

# class Car:
#     wheels = 4   # class variable

#     # Initializer / Constructor
#     def __init__(self, color, brand, model):
#         # Instance variables
#         self.color = color
#         self.brand = brand
#         self.model = model

#     def drives(self):
#         return f"The {self.color} {self.brand} {self.model} is driving."


# Mycar1 = Car("Red", "Toyota", "Camry")
# print(Mycar1.drives())
# print(Mycar1.wheels)
# print(Mycar1.color)
# print(Mycar1.brand)
# print(Mycar1.model)


# class person:
#     def __init__(self, name, age):
#         self.name = name
#         self.age = age
# details = person("Harshita", 20)
# print(details)
# p1 = person("Harshita", 20)
# print(p1.name)

# class Person:
#     count =0
#     def __init__(self, name, age):
#         self.name = name
#         self.age = age
#         Person.count += 1

# p1 = Person("Prachi", 20)
# p2 = Person("Anad", 22)

# print(Person.count)  # Output: 2
# print(p1.name,p1.age)      # Output: 2
# print(p2.name,p2.age)


# class person:
#     def __init__(self, name, age):
#         self.name = name
#         self.age = age

#     def myfunc(self,Nickname):
#         print("Hello my name is " + self.name + ' my nickname is '+ Nickname + ' and my age is ' + str(self.age)) 

# p1 = person("Harsh", 20)
# p1.myfunc("Aman")

# class person:
#     def __init__(self, name, age):
#         self.name = name
#         self.age = age

#     def myfunc(self,Nickname):
#         print("Hello my name is " + self.name + ' my nickname is '+ Nickname) 

# p1 = person("Harsh", 20)
# del p1.age
# p1.myfunc("Aman")

class Person:
    def __init__(self, fname, lname):
        self.firstname = fname
        self.lastname = lname

    # def printname(self):
    #     print(self.firstname, self.lastname)

    def welcome(self):
        print(self.firstname, self.lastname,self.graduationyear)

#Methos 1 calling parent class constructor in child class
# class Student(Person):
#     pass

#Methos 2 calling parent class constructor in child class
# class Student(Person):
#     def __init__(self, fname, lname):
#         Person.__init__(self, fname, lname)

#Methos 3 calling parent class constructor in child class
# class Student(Person):
#     def __init__(self, fname, lname):
#         super().__init__(fname, lname)

#adding more properties to child class
class Student(Person):
    def __init__(self, fname, lname,year):
        super().__init__(fname, lname)
        self.graduationyear = year
p1 = Student("Muskan", "Singh",2024)
p1.welcome()