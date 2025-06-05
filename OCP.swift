/// MARK: Open/Closed Principle (OCP)

/// MARK: Theory section

/***
Code should be open for extension but closed for modification.
***/

/// MARK: Violation of OCP

/***
This function uses conditional checks to determine the payment method.
Adding a new payment method would require modifying the existing code.


final class PaymentProcessor {
    func processPayment(type: String, amount: Double) {
        if type == "credit_card" {
            print("Pay amount: \(amount) with credit card")
        } else if type == "paypal" {
            print("Pay amount: \(amount) with PayPal")
        } else {
            print("Unknown payment method")
        }
    }
}

let processor = PaymentProcessor()
processor.processPayment(type: "credit_card", amount: 100.0)
processor.processPayment(type: "paypal", amount: 200.0)

***/

/// MARK: Open/Closed Principle solution

/***
Solution: abstraction by implementing a protocol, this way we can
add new payment method without modifying the PaymentProcessor class
***/

protocol PaymentMethod {
    func pay(amount: Double)
}

final class CreditCardPayment: PaymentMethod {
    func pay(amount: Double) {
        print("Pay amount: \(amount) with credit card")
    }
}

final class PayPalPayment: PaymentMethod {
    func pay(amount: Double) {
        print("Pay amount: \(amount) with PayPal")
    }
}

final class PaymentProcessor {
    func processPayment(method: PaymentMethod, amount: Double) {
        method.pay(amount: amount)
    }
}

let processor = PaymentProcessor()
let creditCard = CreditCardPayment()
let paypal = PayPalPayment()

processor.processPayment(method: creditCard, amount: 100.0)
processor.processPayment(method: paypal, amount: 200.0)

/// MARK: Practice section

/***

Exercise to refactor

struct Rectangle {
    var width: Double
    var height: Double
}

struct Circle {
    var radius: Double
}

enum ShapeType {
    case rectangle
    case circle
}

class AreaCalculator {
    func calculateArea(shape: ShapeType, dimensions: Any) -> Double {
        switch shape {
            case .rectangle:
                if let rect = dimensions as? Rectangle {
                    return rect.width * rect.height
                }
            case .circle:
                if let circle = dimensions as? Circle {
                    return Double.pi * circle.radius * circle.radius
                }
        }
        return 0.0
    }
}

let rectangle = Rectangle(width: 5.0, height: 10.0)
let circle = Circle(radius: 3.0)

let areaCalculator = AreaCalculator()

let rectangleArea = areaCalculator.calculateArea(shape: .rectangle, dimensions: rectangle)
print("Rectangle area: \(rectangleArea)")

let circleArea = areaCalculator.calculateArea(shape: .circle, dimensions: circle)
print("Circle area: \(circleArea)")
***/

/// MARK: Refactored solution

protocol Shape {
    func area() -> Double
}

struct Rectangle: Shape {
    var width: Double
    var height: Double

    func area() -> Double {
        return width * height
    }
}

struct Circle: Shape {
    var radius: Double

    func area() -> Double {
        return Double.pi * radius * radius
    }
}

class AreaCalculator {
    func calculateArea(shape: Shape) -> Double {
        return shape.area()
    }
}

let rectangle = Rectangle(width: 10, height: 5)
let circle = Circle(radius: 7)

let areaCalculator = AreaCalculator()

let rectangleArea = areaCalculator.calculateArea(shape: rectangle)
let circleArea = areaCalculator.calculateArea(shape: circle)

print(rectangleArea, circleArea)