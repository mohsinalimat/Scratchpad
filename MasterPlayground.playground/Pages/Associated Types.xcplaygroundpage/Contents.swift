//: [Previous](@previous)

import Foundation

protocol Initializable {
    init()
}

class Pokemon<Power: Initializable> {
    func attack() -> Power {
        return Power()
    }
}

//: [Next](@next)
