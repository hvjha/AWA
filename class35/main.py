#single Inheritance

class Dog:
    def __init__(self,name):
        self.name=name

    def display_name(self):
        print(f"Dog name is: {self.name}")

class labrador(Dog):
    def sound(self):
        print("Labrador woofs")

#multi-level Inheritance
class GuideDog(labrador):
    def guide(self):
        print(f"{self.name} Guide dog is helping visually impaired person")

#multiple Inheritance
class friendly:
    def greet(self):
        print("The dog is very friendly")

class GoldenRetriever(Dog, friendly):
    def sound(self):
        print("Golden Retriever barks")

lab=GuideDog("Buddy")
lab.display_name()  
lab.sound()

guide_dog=GuideDog("Max")
guide_dog.display_name()
guide_dog.guide()

golden=GoldenRetriever("Charlie")
golden.display_name()   
golden.sound()
golden.greet()