// Liskov Substitution Principle

/// MARK: Theory section

/***

Subclasses should replace the parent class without
changing the program's logic
***/

/***
// This is a violation of this principle
// refuelCar expects a Car to be refueled, but ElectricCar cannot be refueled with gasoline.

final class Car {
    func drive() {
        print("Drive")
    }

    func refuel() {
        print("Refuel")
    }
}

class GasolineCar: Car { }

class ElectricCar: Car {
    override func refuel() {
        fatalError("Can't fuel an electric car with gasoline")
    }
}

func refuelCar(_ car: Car) {
    car.refuel()
}

let tesla = ElectricCar()
refuelCar(tesla) -> runtime error

***/

// Solution for the violation from above
class Car {
    func drive() {
        print("Drive")
    }
}

protocol Fuelable {
    func refuel()
}

protocol Chargeable {
    func charge()
}

final class GasolineCar: Car, Fuelable {
    func refuel() {
        print("Refuel with gasoline")
    }
}

final class ElectricCar: Car, Chargeable {
    func charge() {
        print("Charge")
    }
}

func refuelCar(_ car: Fuelable) {
    car.refuel()
}

let bmw = GasolineCar()
refuelCar(bmw)

let tesla = ElectricCar()
// refuelCar(tesla) -> compilation error, which is good