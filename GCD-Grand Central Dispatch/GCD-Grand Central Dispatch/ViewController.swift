//
//  ViewController.swift
//  GCD-Grand Central Dispatch
//
//  Created by Sebastian Boldt on 05.07.16.
//  Copyright © 2016 Sebastian Boldt. All rights reserved.
//

import UIKit

//TODO: More Documentation, Semaphore & Dispatch Source

class ViewController: UIViewController {

    // QOS
    // .userInitiated -> Button Tapped
    // .background -> Networking 
    
    // USE SYNC FOR LOCKING PURPOSES
    
    // DISPATCH_ONCE
    // dispatch_once is no longer available in Swift 3.0
    // instead you should use lazily instantiated static properties like so:
    static let justOnce : String = {
        return "TestString"
    }()
    
    private func testStaticeOnce() {
        print(ViewController.justOnce)
        // Not able to set 
        // ViewController.justOnce = 200, can not assign cause justOnce is let
    }
    
    // ASYNC
    @IBAction func testDispatchAsync() {
        print("**********************")
        print("Before Dispatch_Async")
        //Execution of the calling thread continues
        DispatchQueue.global(attributes:.qosUserInitiated).async(execute:{ [weak self] in
            // Doing some heavy work, networking calls or heavy calculations
            self?.heavyWork()
            // If Calculation finishes go back to Main Queue (Serial and Main Thread)
            DispatchQueue.main.async(execute:{
                print("Finished work in background, back on main thread")
            })
        })
        
        print("Doing something on main thread")
    }
    
    // SYNC
    // CAUTION: Be VERY careful in this situation; if you’re running in a queue and call dispatch_sync targeting the same queue, you will definitely create a deadlock.
    // Deadlocks are also possible with a tree state system configuration
    @IBAction func testDispatchSync() {
        print("**********************")
        print("Before Dispatch_Sync")
        DispatchQueue.global(attributes: .qosUserInitiated).sync {
            [weak self] in
            print("Current Queue stopped")
            print("Doing some heavy work")
            self?.heavyWork()
        }
        
        print("Stopped Queue continues")
    }
    
    // CUSTOM SERIAL QUEUE
    @IBAction func testCustomSerialQueue() {
        print("**********************")
        print("Before Dispatching to Custom Queue")
        let serialQueue = DispatchQueue(label:"Serial Queue", attributes: .serial) // You could also create a .concurrent Queue
        // We could also use dispatch_sync so current Queue would be stopped
        serialQueue.async { [weak self] in
            self?.heavyWork()
            print("1.finished with call")
        }
        
        serialQueue.async {
            print("2. Will be printed after first async call finished cause we are using a serial queue")
        }
        
        print("Will be printed between 1 and 2 because calling thread will not be stopped")
    }
    
    // DISPATCH_AFTER
    @IBAction func testDispatchAfter() {
        print("**********************")
        print("Please wait for 2 seconds")
        DispatchQueue.main.after(when: .now() + 2) { [weak self] in
            let controller = UIAlertController(title: "Dismiss me", message: "Dismiss me", preferredStyle:.alert)
            let dismissAction = UIAlertAction(title: "Cancel", style: .cancel) {
                action in
                controller.dismiss(animated: true) {
                    print("dismissed")
                }
            }
            controller.addAction(dismissAction)
            self?.present(controller, animated:true) {
                print("presented")
            }
        }
    }
    
    // DISPATCH_BARRIES
    // Using GCD’s barrier API ensures that a submitted block is the only item executed on the specified queue for that particular time
    // * making no sense one custom serial queues cause they would do nothing
    // * Dont use it on global concurrent queues cause other system services also using these queues
    // * Custom concurrent queues are basically the place where dispatch_barriers should be used
    
    @IBAction func testDispatchBarries() {
        // Creating our own custom concurrent queue
        let concurrentQueue = DispatchQueue(label: "Testing Dispatch Barriers", attributes: .concurrent)
        concurrentQueue.async { [weak self] in
            self?.heavyWork()
            print("1. finished with concurrent task")
        }
        
        concurrentQueue.async(flags: .barrier, execute:{ [weak self] in
            print("Barrier started")
            print("I am the only one being executed ^^")
            self?.heavyWork()
            print("I am still the only one")
            print("Now other tasks can start")
        })
        
        concurrentQueue.async {
            print("Should be started after barrier completed")
        }
        
    }
    
    // DISPATCH_GROUPS
    // Dispatch groups are used to inform you when a number of tasks are finished 
    // you can use dispatch_group_wait to stop the current thread and wait for finishing 
    // and you can use dispatch_group_notify
    
    @IBAction func testDispatchGroups() {
        
        let queue = DispatchQueue(label: "ConQueue", attributes: .concurrent)
        let group = DispatchGroup()
        
        queue.async(group: group) { [weak self] in
            self?.heavyWork()
        }
        
        queue.async(group: group) { [weak self] in
            self?.heavyWork()
        }
        
        // group.wait() // Would stop current thread until all tasks are done
        group.notify(queue: queue) {
            print("Finished with two tasks")
        }
    }
    
    // DISPATCH_APPLY
    // just use it for large sets of data
    @IBAction func testDispatchApply() {
        let group = DispatchGroup()
        DispatchQueue.concurrentPerform(iterations: 500) { [weak self] i in
            DispatchQueue.global().async(group: group) {
                print("Iteration: \(i)")
                self?.heavyWork()
            }
        }
        
        group.notify(queue: DispatchQueue.global()) {
            print("Finished 500 iteration with heavy work")
        }
    }
    
    // DISPATCH_BLOCK
    // Blocks that can be cancelled
    // In Swift 3 we call this Dispatch_Work_item
    @IBAction func testDispatchItems() {
        let queue = DispatchQueue.global(attributes:[.qosUserInitiated])
        // assignCurrentContext used current QOS
        var item : DispatchWorkItem?
        item = DispatchWorkItem(flags:.assignCurrentContext) { [weak self] in
            for i in 0...10000000 {
                if let item = item {
                    if item.isCancelled { break }
                }
                print(i)
                self?.heavyWork()
            }
        }
        
        if let item = item {
            queue.async(execute: item)
            queue.after(walltime: .now() + 2) {
                item.cancel()
            }
        }
    }
    
    @IBAction func testLocking() {
        let object = MyObject()
        
        let queue1 = DispatchQueue(label: "queue1",attributes: .concurrent)
        let queue2 = DispatchQueue(label: "queue2",attributes: .concurrent)
        
        queue1.async {
            object.state = 20
        }
        
        queue2.async {
            object.state = 100
        }
        
    }
}

extension ViewController {
    /// Function that takes some time
    func heavyWork() {
        for i in 0...10000 {
            let _ = i*1337*1337
        }
        print("finished")
    }
}


// Locking
class MyObject {
    private var internalState: Int = 0
    private let internalQueue: DispatchQueue = DispatchQueue(label:"LockingQueue",attributes: .serial)
    
    var state: Int {
        get {
            return internalQueue.sync { internalState }
        }
        
        set (newState) {
            internalQueue.sync { internalState = newState }
        }
    }
}

