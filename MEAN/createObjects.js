function VehicleConstructor (name, numWheels, numPass, speed) {
  this.distance_travelled = 0;
  this.name = name;
  this.wheels = numWheels;
  this.passengers = numPass;
  this.speed = speed;
  this.vin = Math.floor(Math.random()*1000000000)
  if (!(this instanceof VehicleConstructor)) {
     return new VehicleConstructor(name, numWheels, numPass, speed);
   }
}
VehicleConstructor.prototype.makeNoise = function() { return this };
VehicleConstructor.prototype.checkMiles = function() {
  console.log(this.distance_travelled);
  return this;
}
VehicleConstructor.prototype.updateDistanceTravelled = function() {
  this.distance_travelled += this.speed;
  return this;
}
VehicleConstructor.prototype.move = function() {
  this.updateDistanceTravelled();
  this.makeNoise();
  return this;
}

var bike = new VehicleConstructor("Bike", 2, 1, 15);
bike.makeNoise = function() {
  console.log("ring ring!");
}
bike.move().checkMiles();

var sedan = new VehicleConstructor("Sedan", 4, 5, 65);
sedan.makeNoise = function() {
  console.log("Honk Honk!");
}
sedan.makeNoise();

var bus = new VehicleConstructor("Bus", 4, 0, 40);
bus.pickUp = function(num) {
  bus.passengers += num;
}
console.log(bus.passengers);
bus.pickUp(10);
console.log(bus.passengers);
