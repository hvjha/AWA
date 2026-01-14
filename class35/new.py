#polymorphism 
#same function name with different classes
# types of polymorphism
#1. compile time polymorphism (method overloading)
    #it determines at compile time which method to call based on parameters
    #python does not support method overloading directly
    #here have same method name with different number of parameters
#2. run time polymorphism (method overriding)
    #it determines at runtime which method to call based on the object type
    #here have same method name in base class and derived class

#example of method overriding
class Dog:
    def sound(self):
        print("Dog sound")

class Labrador(Dog):
    def sound(self):
        print("Labrador woofs")

class GoldenRetriever(Dog):
    def sound(self):
        print("Golden Retriever barks")

# dogs = [Dog(), Labrador(), GoldenRetriever()]
# for dog in dogs:
#     dog.sound()  #calls the appropriate sound method based on the object type

# dogs = GoldenRetriever()
# dogs.sound()  #calls the appropriate sound method based on the object type

#example of method overloading using default arguments
class MathOperations:
    def add(self, a, b, c=0):
        return a + b + c
    
math_ops = MathOperations()
# print(math_ops.add(2, 3))        #calls add with 2 parameters
# print(math_ops.add(2, 3, 4))     #calls add with 3 parameters


# encapsulation
#binding data and methods within a single unit
# types of encapsulation    
#1. public encapsulation
    #attributes and methods are accessible from outside the class       
#2. private encapsulation
    #attributes and methods are not accessible from outside the class
#3. protected encapsulation
    #attributes and methods are accessible within the class and its subclasses

#example of public encapsulation
class Person:
    def __init__(self, name, age):
        self.name = name      #public attribute
        self.age = age        #public attribute

    def display_info(self):
        print(f"Name: {self.name}, Age: {self.age}")    
person = Person("Alice", 30)
# person.display_info()

#example of private encapsulation
class BankAccount:
    def __init__(self, account_number, balance):
        self.__account_number = account_number  #private attribute
        self.__balance = balance                  #private attribute

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            print(f"Deposited: {amount}")
        else:
            print("Deposit amount must be positive")

    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            print(f"Withdrew: {amount}")
        else:
            print("Insufficient balance or invalid withdrawal amount")

    def get_balance(self):
        return self.__balance
    
# account = BankAccount("123456789", 1000)
# account.deposit(500)
# account.withdraw(200)       
# print(f"Current Balance: {account.get_balance()}")

#example of protected encapsulation
class Vehicle:      
    def __init__(self, make, model):
        self._make = make        #protected attribute
        self._model = model      #protected attribute

    def display_info(self):
        print(f"Make: {self._make}, Model: {self._model}")
class Car(Vehicle):
    def display_info(self):
        print(f"Car Make: {self._make}, Car Model: {self._model}")
car = Car("Toyota", "Camry")
# car.display_info()  


# class Employee:
#     def __init__(self, name, company, salary):
#         self.name = name          # Public
#         self._company = company   # Protected
#         self.__salary = salary    # Private

    # Public method
    # def display_public(self):
    #     print(f"Name: {self.name}")

    # Protected method
    # def _display_protected(self):
    #     print(f"Company: {self._company}")

    # Private method
    # def __display_private(self):
    #     print(f"Salary: {self.__salary}")

    # Public method to access private data
    # def show_salary(self):
    #     self.__display_private()

# emp = Employee("Harsh", "Google", 80000)

#Access Public
# print(emp.name)
# emp.display_public()

#Access Protected (allowed but NOT recommended)
# print(emp._company)
# emp._display_protected()

#Access Private (NOT allowed)
# print(emp.__salary)           # AttributeError
# emp.__display_private()       # AttributeError

#Correct way to access private data
# emp.show_salary()


class Employee:
    def __init__(self, name, salary):
        self.name = name          # Public
        self._department = "IT"   # Protected
        self.__salary = salary   # Private

    def get_salary(self):
        return self.__salary

class Manager(Employee):
    def display_details(self):
        print("MName:", self.name)              # Public access
        print("Department:", self._department) # Protected access
        # print(self.__salary)                 #Private not accessible
        print("Salary:", self.get_salary())

class Company:
    def show_employee(self, emp):
        print("CName:", emp.name)              #Public
        print("Department:", emp._department) #Protected (not recommended)
        # print(emp.__salary)                 Private not accessible
        print("Salary:", emp.get_salary())    #Access via method

mgr = Manager("Muskan", 90000)

mgr.display_details()

company = Company()
company.show_employee(mgr)

# Outside direct access
print(mgr.name)          # Public
print(mgr._department)   # Protected
#print(mgr.__salary)    # Private  
print(mgr.get_salary())  # Access via method   