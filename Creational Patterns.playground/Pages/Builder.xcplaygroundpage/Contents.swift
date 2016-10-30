//: [Previous](@previous)

import Foundation


class Builder {
    
    var x: Double?
    var y: Double?
    var z: Double?
    
    typealias BuilderClosure = (Builder) -> ()
    
    init(closure:BuilderClosure) {
        closure(self)
    }
}

struct ThingToBuild: CustomStringConvertible {
    let x : Double
    let y : Double
    let z : Double
    
    init?(builder: Builder) {
        if let x = builder.x, y = builder.y, z = builder.z {
            self.x = x
            self.y = y
            self.z = z
        } else {
            return nil
        }
    }
    
    var description:String {
        return "Death Star at (x:\(x) y:\(y) z:\(z))"
    }
}

let testBuilder = Builder { builder in
    builder.x = 10
    builder.y = 20
    builder.z = 30
}

let instance = ThingToBuild(builder: testBuilder)

//: [Next](@next)
