//: [Previous](@previous)

import Foundation

protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
}

struct Test<T>: Container {
    var items = [T]()
    mutating func append(item: T) {
        items.append(item)
    }
}

var t = Test<String>()

t.append(item:"Test")
t.append(item:"Was geht ab")

print(t.items)


//: [Next](@next)
