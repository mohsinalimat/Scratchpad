//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// DOCK 

// The Dock was written in Swift since El Capitan 
// 200.000 lines of Code 
// 2.5x more Swift Code


// SWIFT OPEN SOURCE 

// swift.org
// Migration Guides 
// Documentation 
// REPL & Debugger etc. 
// All Development is happening on Github 

// Three Cores
// • Package Manager 
// • Core Libraries 
// •

// API DESIGN
// Things that really matters is clarity

// OLD
let array = [2,3,4]
array.appendContentsOf([4,5,6])
// NEW
array.append(contentsOf:[4,5,6])

//OLD
array.insert(1,atIndex:0) // Index adds no extra value
//NEW
array.insert(1,at:0)

//OLD
if url.fileURL {} // Does not show that its boolean
//NEW
if url.isFileURL{}

//OLD
let x = url.URLByAppendingPathComponent("file.txt")
//NEW
let y = url.appendingPathComponent("file.txt")


// CORE LANGUAGE
func myFunction(a:Int,b:Int,c:Int) {
    //bla
}
//OLD
myFunction(10,20,30)
//NEW
myFunction(a:10,b:20,c:40)

// GENERICS - Moved where to end
// OLD
func anyCommon<T:Sequence, U:Sequence where T.Element: Equatable, T.Element == U.Element>(lhs: T, rhs: U) -> Bool {
    
}

// NEW
func anyCommon<T:Sequence, U:Sequence>(lhs:T,rhs:U) -> Bool where T.ELement: Equatable, T.Element == U.Element {
    
}

// UNUSED RESULTS

// Default warning for unused return values 
//@warn_unused_result
@discardableResult
func plusOne(_a:Int) -> Int {
    print(a)
    return a+1
}

plusOne(20)
_ = plusOne(30) // I dont care about the return value


// Features Removed in swift 

// Currying func decalration syntax
// var in function paramter list
// ++ and -- operators 
// C-style for loop
// Implicit tuple splat in calls

// A lot of Syntax improvements
// UnsafePointer can use optional syntax 

// Implictly unwrap optionals
//OLD
func f(value : Int!) {
    let x = value + 1 // x: Int - force unwrapped
    let y = value // y: Int!
    let array = [value, 42] // [Int], [Int!], [Int?], [Any]...
    use(array)
}
//NEW 
func f(value : Int!) {
    let x = value + 1 // x: Int - force unwrapped 
    let y = value // y: Int?
    let array = [value, 42]
    let array2 = [value!, 42] // [Int]
    use(array)
}

// Floating Point and Numerics
let v = 2 * Float.pi

// SWIFT TOOLS 
// Revamped dictionary Implementation 
// Whole module optimization -> Creates one big file and compiles it 
// Compiler is bottle neck -> Better chaching etc. 
// Xcode: Improved navigation in swift code 
// - All kinds of new Documentation 
// - Migration
#if swift(>=2.3)
    return frame!
#else
    return frame
#endif

//: [Next](@next)
