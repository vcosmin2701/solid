// Dependency Inversion Principle

// Theory section

/***
high-level modules should not depend on low-level modules
both should depend on abstractions (protocols, interfaces)
***/

/*** violation example
final class MySQLDatabase {
    func saveOrder(order: String) {
        print("MySQL save order: \(order)"
    }
}

final class OrderService {
    let database = MySQLDatabase() // strong dependency

    func createOrder(order: String) {
        print("Creating order: \(order)")
        database.saveOrder(order.order) // Strong relation with MySQLDatabase
    }
}

let service = OrderService()
service.createOrder(order: "#123"
***/

// Solution

protocol Database {
    func saveOrder(order: String)
}

final class MySQLDatabase : Database {
    func saveOrder(order: String) {
        print("X save order: \(order)")
    }
}

final class PostgreSQLDatabase : Database {
    func saveOrder(order: String) { 
        print("X save order: \(order)")
    }
}

final class OrderService {
    let database: Database

    init(database: Database) {
        self.database = database
    }

    func createOrder(order: String) {
        print("Creating order: \(order)")
        database.saveOrder(order: order)
    }
}

let mysqlDB = MySQLDatabase()
let postgreDB = PostgreSQLDatabase()

let service1 = OrderService(database: mysqlDB)
service1.createOrder(order: "#123")

let service2 = OrderService(database: postgreDB)
service2.createOrder(order: "#456")


