//: [Previous](@previous)

import Foundation

// Filter
let array = [1,2,3,4,5]
let filteredArray = array.filter { $0 > 3 }
let anotherFilteredArray = array.filter { num in num < 3}
print(filteredArray)
print(anotherFilteredArray)

// Rewriting filter 

extension Array {
    func ownFilter(_ with: ((Element) -> Bool)) -> [Element] {
        var newArray = [Element]()
        for element in self {
            if with(element) {
                newArray.append(element)
            }
        }
        return newArray
    }
}


// testing own filter
let a = [1,2,3,4,5,6,7,8]

let b = a.ownFilter { number in
    number < 5
}

print(b)
