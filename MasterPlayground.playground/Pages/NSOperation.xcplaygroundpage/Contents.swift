//: [Previous](@previous)

import Foundation

//: # NSOperation

class CustomTask : Operation {
    override func start() {
        print("I am running")
    }
}

let queue = OperationQueue()
queue.addOperation(){
    print("I am also running")
    print("\(OperationQueue.current)")
}
queue.addOperation(CustomTask())

// Adding block to mainQueue
OperationQueue.main.addOperation(){
    print("I am running on a background thread")
}
//: [Next](@next)
