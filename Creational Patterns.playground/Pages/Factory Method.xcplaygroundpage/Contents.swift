//: [Previous](@previous)

import Foundation

protocol Currency {
    func symbol() -> String
    func code() -> String
}

class Euro : Currency {
    func symbol() -> String {
        return "€"
    }
    
    func code() -> String {
        return "EUR"
    }
}

class Dollar : Currency {
    func symbol() -> String {
        return "$"
    }
    
    func code() -> String {
        return "US"
    }
}

enum Country {
    case US,UK, Greece
}

enum CurrencyFactory {
    static func currencyForCountry(country: Country) -> Currency? {
        switch country {
        case .Greece,.UK :
            return Euro()
        case .US:
            return Dollar()
        default
            return nil
        }
    }
}

let currencyCodeForUK = CurrencyFactory.currencyForCountry(country: .UK)?.code()
