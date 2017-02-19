class Animal(object):
    def __init__(self, name="Animal"):
        self.health = 100
        self.name = name

    def walk(self):
        self.health -= 1
        return self

    def run(self):
        self.health -= 5
        return self

    def displayHealth(self):
        print self.name, "-", self.health, "health"
        return self

class Dog(Animal):
    def __init__(self, name):
        super(Dog, self).__init__(name)
        self.health += 50

    def pet(self):
        self.health += 5
        return self

class Dragon(Animal):
    def __init__(self, name):
        super(Dragon, self).__init__(name)
        self.health += 70

    def fly(self):
        self.health -= 10
        return self

    def displayHealth(self):
        print "this is a dragon!"
        super(Dragon, self).displayHealth()

goat = Animal("Goat")
goat.walk().walk().walk().run().run().displayHealth()

fido = Dog("Fido")
fido.walk().walk().walk().run().run().pet().displayHealth()

drake = Dragon("Infernal Drake")
drake.walk().walk().walk().fly().fly().displayHealth()

# goat.fly()
# goat.pet()
# these don't work
