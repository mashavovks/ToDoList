//
//  ToDo.swift
//  ToDoList
//
//  Created by student15 on 4/14/19.
//  Copyright © 2019 student15. All rights reserved.
//

import Foundation

struct ToDo: Codable {
    
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
        //text for the dueDateLabel reflects the value the user enters in the date picker. DateFormatter object to convert a date into a string. The static keyword ensures that the date object isn't tied to a particular instance of my model. Using .short displays the shortest format possible.
    }()
    
    static let DocumentsDirectory =
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    //path defined to store data
    
    
    static func loadToDos() -> [ToDo]? {
        //return nil//a static method to retrieve the array of items stored and returns them if the disc has any items
        guard let codedToDos = try? Data(contentsOf: ArchiveURL)
            else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
        //logic that loads data from the disc, unarchives data and returns it.
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        return [todo1, todo2, todo3]
        //static arrays to populate the disc
    }
    
    static func saveToDos(_ todos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)
        //saves model data to disk. A static method that uses a PropertyListEncoder to encode a ToDo collection and then uses a method to store it in the Documents directory.
    }
    
    
}


