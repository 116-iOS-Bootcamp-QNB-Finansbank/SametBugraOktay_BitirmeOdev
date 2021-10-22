//
//  ToDoDetailViewController.swift
//  ToDoApp
//
//  Created by Samet Bugra Oktay on 19.10.2021.
//

import UIKit

class ToDoDetailViewController: UIViewController, UITextFieldDelegate {
    


    @IBOutlet weak var todoName: UITextField!
    
    
    @IBOutlet weak var todoDetail: UITextField!
    
    
    @IBOutlet weak var todoTime: UIDatePicker!
    
    
    let myNotificationKey = "todoList"
    
    var todo : Entity?
    
    var viewModel: TodoDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        NotificationCenter.default.addObserver(self,
                                                   selector: #selector(notify),
                                                   name: NSNotification.Name(rawValue: myNotificationKey),
                                                   object: nil)
        
    }

    @objc func notify() {
        print("Notify")
    }

    
    @IBAction func addButton(_ sender: Any) {
        
        guard let todoNameText = todoName.text, !todoNameText.isEmpty else { return }
        guard let todoDetailText = todoDetail.text, !todoDetailText.isEmpty else { return }
        
        let todoDetail = ToDoDetailModel(name: todoNameText, detail: todoDetailText, finishTime: todoTime.date)
        
        //viewModel.saveTodo(ToDoDetailModel: todoDetail)
        
        if todo == nil {
            CoreDataManager.instance.addTodo(todoDetailPresentation: todoDetail)
        }
        else {
            CoreDataManager.instance.updateTodo(todoDetailModel: todoDetail, todo:todo!)
        }
        
        
    NotificationCenter.default.post(name: Notification.Name(rawValue: myNotificationKey), object: self)
    
        navigationController?.popViewController(animated: true)
        print("success")
      
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
  
       // CoreDataService.instance.deleteTodo(todo: Entity)
        
        navigationController?.popViewController(animated: true)
        print("succesfully deleted")
        
    }
    
    
}

extension ToDoDetailViewController: TodoDetailViewModelDelegate {
    
    func showTodoDetail(_ todo: ToDoDetailModel) {
        todoName.text = todo.name
        todoDetail.text = todo.detail
        todoTime.date = todo.finishTime
    }
}





