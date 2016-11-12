//: Playground - noun: a place where people can play

// Swift Coding Challenges

import UIKit
// Code Challenges

// 1. Swapping two values with one line of code
var str = "Hello, playground"
func swap<T>(a: inout T, b: inout T) {
    (a,b) = (b,a)
}

var a = 10
var b = 20
swap(&a, &b)
a
b

// 2. Write a Function that joins three Strings with one line of code

func concStrings(s1: String? = nil, s2: String? = nil, s3: String? = nil) -> String {
    return  [s1,s2,s3].flatMap { $0 }.joined()
}

concStrings(s1:"Test",s2:"Test",s3:"Test")
concStrings(s1:"Test",s2:"Test")
concStrings()

// 3. Write a Function that appends description of objects that are CustomStringConvertible
struct foo: CustomStringConvertible {
    var description: String {
        return "foo"
    }
}

func conc(params:CustomStringConvertible...) -> String {
    return params.reduce("") {next,current in return next.description + current.description}
}

let c = foo()
conc(params: 2,3,4,5,c)


/* Write a function countFrom(from:Int, #to:Int) that will produce as output (eg. via print() or println()) the numbers from from to to. You can’t use any loop operators, variables, nor any built-in Array functions. Assume the value of from is less than to (eg. the input is valid). */

func countFrom(from: Int, to: Int) {
    if (from <= to) {
        print(from)
        countFrom(from: from+1, to: to)
    }
}

countFrom(from: 0, to: 3)

/* Write a single function that reverses the text in a string. For example, when passed the string “Marin Todorov” will return the string “vorodoT niraM”. Dont use loops etc. use Recursion */


extension String {
    func reversed() -> String {
        return reverseString(text: self, lastCharacters: "")
    }
    
    fileprivate func reverseString(text:String, lastCharacters: String) -> String {
        if let lastCharacter = text.characters.last {
            let subText = text.substring(to: text.index(text.endIndex, offsetBy: -1))
            return reverseString(text: subText, lastCharacters: lastCharacters + String(lastCharacter))
        } else {
            return lastCharacters
        }
    }
}



"Reverse Me".reversed()



























