//: [Previous](@previous)

import Foundation

//: # NSURL

let urlString = "http://www.sebastianboldt.com/developer/music?parameter=1000"
let url = NSURL(string: urlString)

url?.baseURL
url?.host
url?.path
url?.query
url?.pathComponents
url?.lastPathComponent
url?.absoluteURL
url?.absoluteString

//: # NSURLComponents

let components = NSURLComponents()
components.host = "sebastianboldt.com"
components.scheme = "http"
components.fragment = "scrollToMenu"
let queryItem = NSURLQueryItem(name:"test", value: "200")
components.queryItems = [queryItem]
components.URL


// NSURLRequest

// NSURLSession

// NSURLSessionConfiguration

// NSURLDataTask

// NSURLDownloadTask

// NSURLUploadTask

//: [Next](@next)
