//: [Previous](@previous)

import Foundation

//: # NSURL

let urlString = "http://www.sebastianboldt.com/developer/music?parameter=1000"
let url = URL(string: urlString)

url?.baseURL
url?.host
url?.path
url?.query
url?.pathComponents
url?.lastPathComponent
url?.absoluteURL
url?.absoluteString

//: # NSURLComponents

var components = URLComponents()
components.host = "sebastianboldt.com"
components.scheme = "http"
components.fragment = "scrollToMenu"
let queryItem = URLQueryItem(name:"test", value: "200")
components.queryItems = [queryItem]
components.url


// NSURLRequest

// NSURLSession

// NSURLSessionConfiguration

// NSURLDataTask

// NSURLDownloadTask

// NSURLUploadTask

//: [Next](@next)
