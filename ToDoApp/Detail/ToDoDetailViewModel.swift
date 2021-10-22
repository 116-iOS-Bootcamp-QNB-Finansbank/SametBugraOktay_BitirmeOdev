//
//  ToDoDetailViewModel.swift
//  ToDoApp
//
//  Created by Samet Bugra Oktay on 20.10.2021.
//



import UIKit
import Foundation

class ToDoDetailViewModel: TodoDetailViewModelProtocol {
    
    weak var delegate: TodoDetailViewModelDelegate?
    
    private var todo: Entity?
    init() {
        
    }
    
    init(todo: Entity) {
        self.todo = todo
        

    }
    
    func viewDidLoad() {
        if(todo != nil){
            delegate?.showTodoDetail(ToDoDetailModel(todo: todo!))
        }
    }
    
    func saveTodo(ToDoDetailModel : ToDoDetailModel) {
        
        if todo == nil {
            CoreDataManager.instance.addTodo(todoDetailPresentation: ToDoDetailModel)
        } else {
            CoreDataManager.instance.updateTodo(todoDetailModel: ToDoDetailModel, todo:todo!)
        }
    }
    
    func isEmpty() -> Bool{
        return todo == nil
    }
    
    func deleteTodo() {
         
        if todo == nil {
            return
        }
        CoreDataManager.instance.deleteTodo(todo: todo!)
    }
}
