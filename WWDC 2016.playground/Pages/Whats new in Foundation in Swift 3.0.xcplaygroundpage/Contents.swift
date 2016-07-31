//: [Previous](@previous)

import Foundation

/// Cocoa: HomeKit, WatchKit, CoreData -> Based on Foundation -> Swift Standard Library
/// Foundation is Home of many value types
/// Changing something in Foundation changes a lot of things in Cocoa

/// Value types (Copy value on assignment or when passing as paramater)
/// Value & Reference -> neither is better - just used in different ways
/// Reference -> Identiy - Delegates

/*********************************/
/// Class Propertys are brought to Objective-C and Swift
/// @property(class,readonly,strong) userDefaults
class Test {
    internal class var test = 1337 // Stored class propertys wasnt supported in swift 2.2
    internal class func testMe() {
        // Can be overriden by subclass
        // Class functions will be dynamically dispatched
    }
    
    internal static func cantOverride() {
        // Can not be overriden
    }
}


class SubClass : Test {
    override class func testMe() {
        print("overridden")
    }
    
    /*
    override static func cantOverride() {
        // Uncomment this cause it wont compile -> static means final 
    }*/
}

SubClass.testMe()

/// Numberformatter now has internal Types, style, behaviour

/// Many Foundation APIs unse String Constants
/// NSNotificationName or NSURLResourceKey 

/*********************************/
/// New Value Types
/// Date, Measurement (Watch other Talk, Measurement and Units)
/// URLComponents


/*********************************/
/// Character Set and IndexSet conform to SetAlgebra (Intersect & Co.) 
/*********************************/
// Closure based Time API 
let timer = Timer(fireDate:Date(),interval:0,repeats:false) {
    print("Time called this one")
}

RunLoop.main.add(timer,forMode: .commonModes)

// Native Enumerations
let byteCount = 32
var pointer = UnsafeMutablePointer<UInt8>(malloc(byteCount))
let data = Data(bytesNoCopy: pointer, count: count,  deallocator: .free)


