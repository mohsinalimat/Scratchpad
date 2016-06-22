//: [Previous](@previous)

import Foundation

// disapatch_sync
// dispatch_async
// dispatch_after
// disaptch_barrier_async
// dispatch_group_enter
// dispatch_group_notify

print("Hello GCD")

var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
}

var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
}

var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
}

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
}

// Dispatching async

func dispatchSomethingAsync() {
    /// distpatch_async
    dispatch_sync(GlobalMainQueue) { // 1
        // Do something async
        print("running in the background")
        dispatch_async(dispatch_get_main_queue()) { // 2
            // Put it back on the main thread
            print("I am running in the background")
        }
    }
}

dispatchSomethingAsync()
