//: [Previous](@previous)

import Foundation

/*
 Typical C function 
 
void method(const int *num) {
    printf("%d",*num);
} */

/// Its Swift equivalent would be 

func method(num: UnsafePointer<CInt>) {
    print(num.memory) // Access Pointers value using the memory
}

/// const Type * --> UnsafePointer
/// Type * -->UnsafeMutablePointer
var a : CInt = 10
method(&a) // Use & to pass the Address

//: [Next](@next)
