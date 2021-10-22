//
//  ToDoDetailModel.swift
//  ToDoApp
//
//  Created by Samet Bugra Oktay on 20.10.2021.
//

import Foundation

struct ToDoDetailModel {
    
    var name: String
    var detail: String
    var finishTime: Date
  
    
    init(name: String, detail: String, finishTime: Date) {
        self.name = name
        self.detail = detail
        self.finishTime = finishTime
    }
    

    
    init(todo: Entity) {
        self.init(name: todo.name!,
                  detail: todo.detail!,
                  finishTime: todo.finishTime!)
    }
}
