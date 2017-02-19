class Bike(object):
    def __init__(self, price, max_speed, miles=0):
        self.price = price;
        self.max_speed = max_speed;
        self.miles = miles;

    def displayInfo(self):
        print "Price:", self.price
        print "Max Speed:", self.max_speed
        print "Miles:", self.miles
        return self

    def ride(self):
        print "Riding"
        self.miles += 10
        return self

    def reverse(self):
        print "Reversing"
        self.miles -= 5
        return self
        # if you want to stop bike from recording negative mileage
        # if self.miles < 0:
        #     self.miles = 0

bike1 = Bike(200, "25mph")
bike1.ride().ride().ride().reverse().displayInfo()

bike2 = Bike(1000000, "65mph")
bike2.ride().ride().reverse().reverse().displayInfo()

bike3 = Bike(0, "2mph")
bike3.reverse().reverse().reverse().displayInfo()
