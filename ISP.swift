// Interface Segregation Principle

/// MARK: Theory section

/***
Classes should not be forced to implement methods they don't need
***/

/***

protocol Vehicle {
    func drive()
    func sail()
    func fly()
}

class Car: Vehicle {
    func drive() {
        print("Drive.")
    }

    func sail() {
        print("A car can't sail.")
    }

    func fly() {
        print("A car can't fly.")
    }
}

class Boat: Vehicle {
    func drive() {
        print("Can't drive aboat on the road")
    }

    func sail() {
        print("Sail.")
    }

    func fly() {
        print("A boat can't fly")
    }
}

class Airplane: Vehicl {
    func drive() {
        print("A plane can't drive on the road.")
    }

    func sail() {
        print("A plane can't sail.")
    }

    func fly() {
        print("Fly")
    }
}

***/


// Solution: implement interfaces to distinct responsabilities

protocol Drivable {
    func drive()
}

protocol Flyable {
    func fly()
}

protocol Sailable {
    func sail()
}

final class Car: Driveable {
    func drive() {
        print("I'm driving the car")
    }
}

final class Airplane: Flyable {
    func fly() {
        print("Flying with a plane")
    }
}

final class Boat: Sailable {
    func sail() {
        print("Sail on the ocen")
    }
}

