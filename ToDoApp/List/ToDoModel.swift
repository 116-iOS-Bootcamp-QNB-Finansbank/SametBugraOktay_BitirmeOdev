//
//  ToDoModel.swift
//  ToDoApp
//
//  Created by Samet Bugra Oktay on 19.10.2021.
//


import Foundation

struct ToDoModel {
    let title: String
    let date:Date
    let index: Int
    
    init(title: String, date : Date, index: Int) {
        self.title = title
        self.date = date
        self.index = index
    }
    
    init(todo: Entity, index: Int) {
        self.init(title: todo.name!, date: todo.finishTime!, index: index)
    }
}
