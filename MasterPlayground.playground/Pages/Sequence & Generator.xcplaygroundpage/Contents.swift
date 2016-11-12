//: [Previous](@previous)

import Foundation

// Building your custom iteratable container types

// Most of us are used to loop through a collection
let lib = ["Book1","Book2","Book3","Book4"]

for book in lib {
    print(book)
}

/*
 Now, lets say the details of library are encapsulated. i.e.
 The UI layer will receive a library object from the data layer and,
 all we know is that the library object is a collection that supports for-in looping just like an array.
 */

class Book {
    let title : String
    let yearPublished : Int
    
    init(title:String,yearPublished:Int) {
        self.title = title
        self.yearPublished = yearPublished
    }
}

// In order for the libary to support looping it needs to implement the sequence protocol

class Library : Sequence {
    var books = Array<Book>()
    var numberOfBooks : Int {
        return self.books.count
    }
    
    init(books: [Book]) {
        self.books = books
    }
    
    func makeIterator() -> LibraryGenerator{
        return LibraryGenerator(library: self)
    }
}

// Generator Type defines how to iterate through a specific collection
// The GeneratorType needs to implement the next methods
class LibraryGenerator : IteratorProtocol {
    var currentIndex = 0
    let library : Library
    typealias Element = Book
    
    init(library: Library) {
        self.library = library
    }
    
    func next() -> LibraryGenerator.Element? {
        if (currentIndex < self.library.numberOfBooks) {
            let currentBook = self.library.books[currentIndex]
            self.currentIndex = self.currentIndex + 1
            return currentBook
        }
        
        return nil
    }
}

let book1 = Book(title: "The Swift Programming Language", yearPublished: 2014)
let book2 = Book(title: "The Pragmatic Programmer", yearPublished: 1999)
let book3 = Book(title: "Clean Code", yearPublished: 2008)
let book4 = Book(title: "Refactoring", yearPublished: 1999)

let library = Library(books: [book1, book2, book3, book4])

for book in library {
    print(book.title)
}
//: [Next](@next)

