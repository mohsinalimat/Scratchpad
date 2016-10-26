//: [Previous](@previous)

import Foundation

var test : Int? = .some(20)

// I am a simple variable 
var count = 10

// I am an Enum
var singleOptional : Int? = 20

// What an enum ?

switch singleOptional {
    case .Some(let value): print("Optional has an value of \(value)")
    case .None: print("nothing stored inside the enum")
}

switch singleOptional {
case r?:
    print(r)
default:
    print("nil")
}

/// Basically that is all the magic behind optionals
/// Optionals are enums and you can also nest them into each other

var doubleOptional : Int?? = 30

switch doubleOptional {
    case .Some(let wrappedOptional):
        switch wrappedOptional {
            case .Some(let actualValue): print(actualValue)
            case .None: print("nothing stored in inner optional")
        }
    case .None: print("nothing stored in outer optional")
}

// Unwrapping Optionals is super handy .. swift comes with a special syntax for that
// But i will also show you different ways of unwrapping optionals here too

// 1.Basic Unwrap
if let singleOptional = singleOptional {
    print(singleOptional)
}

// Because swift optionals are enums you could also use the case let syntax for unwrapping an optionals
// 2. Enum unwrap
if case let .Some(value) = singleOptional {
    print(value)
}

//Optional Chaining 
struct A {
    let b : B?
}

struct B {
    let x : Int = 10
}

let a : A? = A(b: B())
if let a = a {
    if let b = a.b {
        print(b.x)
    }
}

let yo = a?.b?.x
yo == .Some(20)

let c: Int? = 10
let d: String = "Hello World"
let e = c ?? d



// Unwrapping double Optionals 

//Classic way 

if  let doubeOptional = doubleOptional {
    if let value = doubleOptional {
        print(value)
    }
}
if let doubleOptional = doubleOptional, value = doubleOptional {
    print(value)
}

//Applying Stuff on optionals using map and flatmap without unwrapping it manually

// Single Optional
let newValue = singleOptional.map { $0 * 200 }
print(newValue) // It returns an optional with the new value again 

let anotherWay = singleOptional.flatMap { $0 * 200 }
print(anotherWay)

// Difference between flatmap and map
// flatmaps closure is not designed to return nil inside the close 

let flatted : Int? = singleOptional.map {
    if $0 > 10 {
        return $0
        //return nil // Uncomment this and it will not compile
    }
    else  {return 0}
}

let anotherflatted : Int? = singleOptional.flatMap {
    if $0 > 10 {
        return $0
    }
    else  {return nil}
}

//: [Next](@next)
