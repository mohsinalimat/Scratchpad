//: [Previous](@previous)

import Foundation

/// Playing around with Generics

/// Generic functions 

/// First we declare a protocol that describes a combinable type 

protocol Combinable {
    func +(lhs: Self, rhs: Self) -> Self
}

/// Next we create a Generic function that can add two parameters that are Combinable
func add<Addend:Combinable>(_ a:Addend,b:Addend) -> Addend {
    return a + b
}

/// We define a Type that is combinable

struct ImagNumber {
    var imag : Double
    var real : Double
}

extension ImagNumber : Combinable {}
func +(lhs:ImagNumber,rhs:ImagNumber) -> ImagNumber {
    return ImagNumber(imag: lhs.imag+rhs.imag, real:lhs.real+rhs.real)
}

/// Now we add two Imag Numbers

let a = ImagNumber(imag: 20, real: 20)
let b = ImagNumber(imag: 10, real: 10)

let c = a + b
c.imag
c.real


/// Generic Stack Class

struct Stack<T> {
    
    internal var stack : [T] = [T]() // should be private, made this public for playground
    
    internal mutating func push(_ element:T) {
        stack.insert(element, at: 0)
    }
    
    internal mutating func pop() -> T {
        let poppedElement = stack[0]
        stack.remove(at: 0)
        return poppedElement
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.push(3)

intStack.pop()
intStack.stack

//: [Next](@next)
