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