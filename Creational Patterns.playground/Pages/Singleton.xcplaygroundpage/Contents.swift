//: [Previous](@previous)

import Foundation

struct TheOnlyOne {
    public static var sharedInstance = TheOnlyOne()
    private init() {
        // Needs to be private so you can ensure that only one Instance is created
    }
}

//: [Next](@next)
