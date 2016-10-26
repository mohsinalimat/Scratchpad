//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct HondaWorkShop {
    public var city: String? {
        get {
            return _city
        }
        
        set {
            _city = newValue
        }
    }
    private var _city: String?
    private var compatibleCars: [String]
    private var owner : String
    
    init(city: String? = nil, compatibleCars: [String], owner: String) {
        self.compatibleCars = compatibleCars
        self.owner = owner
        self.city = city
    }
    
    public func clone() -> HondaWorkShop {
        return HondaWorkShop(city: self.city, compatibleCars: self.compatibleCars, owner: self.owner)
    }
    
}

let harald = "Harald" // Harald has more than 1 Workshop and every workshop has the same comptatible cars
let prototype = HondaWorkShop(compatibleCars: ["Civic","Accord","CRX"], owner: harald)
var workShopAmsterdam = prototype.clone()
workShopAmsterdam.city = "Amsterdam"
var workShopNewYork = prototype.clone()
workShopNewYork.city = "New York"
