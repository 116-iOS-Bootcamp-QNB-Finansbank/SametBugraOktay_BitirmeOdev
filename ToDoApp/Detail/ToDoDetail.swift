//
//  ToDoDetailContracts.swift
//  ToDoApp
//
//  Created by Samet Bugra Oktay on 20.10.2021.
//

import Foundation

protocol TodoDetailViewModelDelegate: NSObject {
    func showTodoDetail(_ todo: ToDoDetailModel)
}

protocol TodoDetailViewModelProtocol {
    var delegate: TodoDetailViewModelDelegate? { get set }
    func viewDidLoad()
    func saveTodo(ToDoDetailModel : ToDoDetailModel)
    func deleteTodo()
    func isEmpty() -> Bool
}
