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

/// MARK: Practice section

/***
class Bird {
    func fly() {
        print("The bird is flying high in the sky")
    }

    func eat() {
        print("The bird is eating")
    }
}

class Penguin: Bird {
    override func fly() {
        fatalError("Penguins can't fly")
    }

    func swim() {
        print("The penguin is swimming")
    }
}

func makeBirdFly(_ bird: Bird) {
    print("Attempting to make a bird fly...")
    bird.fly()
    print("---")
}

let sparrow = Bird()
print("Testing with a Sparrow:")
makeBirdFly(sparrow)

let penguin = Penguin()
print("Testing with a Penguin:")
makeBirdFly(penguin
***/

// Practice solution

protocol Flyabe {
    func fly()
}

protocol Swimable {
    func swim()
}

class Bird {
    func eat() {
        print("The bird is eating")
    }
}

class Penguin: Bird, Swimable {
    func swim() {
        print("Penguins can swim")
    }

    override func eat() {
        print("Penguins eat fish")
    }
}

class Sparrow: Bird, Flyabe {
    func fly() {
        print("Sparrows can fly")
    }

    override func eat() {
        print("Sparrows eat seeds")
    }
}

func makeBirdFly(_ bird: Flyabe) {
    print("Attempting to make a bird fly...")
    bird.fly()
    print("---")
}

func makeBirdSwim(_ bird: Swimable) {
    print("Attempting to make a bird swim...")
    bird.swim()
    print("---")
}

let sparrow = Sparrow()
print("Testing with a Sparrow:")
makeBirdFly(sparrow)

let penguin = Penguin()
print("Testing with a Penguin:")
// makeBirdFly(penguin) // This would cause a compilation error, which is good
makeBirdSwim(penguin)

