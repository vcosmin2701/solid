// Single Responsibility Principle violation

/// MARK: Theory section

/***
According to this  principle, each object should have only one responsibility
and that responsibility should be encapusalated within it.

In this case, User class contains: user logic and email-sending logic
*///

final class User {
    let name: String
    let email: String

    init(name: String, email: String) {
        self.name = name
        self.email = email
    }

    func sendEmail(message: String) {
        print("Sending email to \(email) with message: \(message)")
    }
}

let user = User(name: "Agile", email: "freak@agl.com")
user.sendEmail(message: "Welcome to the Agile Freaks!")

// Single Responsibility Principle solution

/// MARK: User class implementation after applying SRP
final class UserSRP {
    let name: String
    let email: String

    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

/// MARK: EmailService class to separate the responsability
final class EmailService {
    func sendEmail(to user: UserSRP, message: String) {
        print("[SRP] Sending email to \(user.email) with message: \(message)")
    }
}

let userSRP = UserSRP(name: "Agile", email: "freak@agl.com")
let emailService = EmailService()
emailService.sendEmail(to: userSRP, message: "[SRP] Welcome to the Agile Freaks!")

/// MARK: Practice section