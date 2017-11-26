//
//  ToDo.swift
//  ToDoList
//
//  Created by Thomas De lange on 25-11-17.
//  Copyright © 2017 Thomas De lange. All rights reserved.
//

import Foundation

struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo one", isComplete: false, dueDate: Date(), notes: "Note 1")
        let todo2 = ToDo(title: "ToDo two", isComplete: false, dueDate: Date(), notes: "Note 2")
        let todo3 = ToDo(title: "ToDo three", isComplete: false, dueDate: Date(), notes: "Note 3")
        
        return [todo1, todo2, todo3]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
