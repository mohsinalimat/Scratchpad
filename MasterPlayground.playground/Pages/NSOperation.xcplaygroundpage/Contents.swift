//: [Previous](@previous)

import Foundation

//: # NSOperation

class CustomTask : NSOperation {
    override func start() {
        print("I am running")
    }
}

let queue = NSOperationQueue()
queue.addOperationWithBlock(){
    print("I am also running")
    print("\(NSOperationQueue.currentQueue())")
}
queue.addOperation(CustomTask())

// Adding block to mainQueue
NSOperationQueue.mainQueue().addOperationWithBlock(){
    print("I am running on a background thread")
}
//: [Next](@next)
