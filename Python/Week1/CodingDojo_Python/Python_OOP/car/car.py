class Car(object):
    def __init__(self, price, speed, fuel, mileage):
        self.price = price
        if price > 10000:
            self.tax = 0.15
        else:
            self.tax = 0.12
        self.speed = speed
        self.fuel = fuel
        self.mileage = mileage

    def display_all(self):
        print "Price:", self.price
        print "Speed:", self.speed
        print "Fuel:", self.fuel
        print "Mileage:", self.mileage
        print "Tax:", self.tax
        print ""


car1 = Car(2000, "65mph", "Empty", "37mpg")
car1.display_all()

car2 = Car(500, "40mph", "Full", "20mpg")
car2.display_all()

car3 = Car(15000, "200mph", "Half empty", "100mpg")
car3.display_all()

car4 = Car(5000, "150mph", "Half full", "30mpg")
car4.display_all()

car5 = Car(4000000000, "30mph", "Full; main turret armed", "12 gallons per mile")
car5.display_all()

car6 = Car(20000, "180mph", "Almost full", "40mpg")
car6.display_all()
