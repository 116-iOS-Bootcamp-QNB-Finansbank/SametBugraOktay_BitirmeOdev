//
//  CoreDataService.swift
//  ToDoApp
//
//  Created by Samet Bugra Oktay on 19.10.2021.
//


import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    
    var context: NSManagedObjectContext

    init() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            context = appDelegate.persistentContainer.viewContext
        }
    
    private func saveContext() {
        do {
           try context.save()
        }
        catch {
        }
    }
    
    func getTodoList() -> [Entity] {
        
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        var results: [Entity] = []
        do {
            results = try context.fetch(fetchRequest)
        } catch {
            //handle error
        }
        
        return results
    }
    
    func addTodo(todoDetailPresentation: ToDoDetailModel) {
         
        let todo : Entity = Entity(context: context)
        
        todo.name = todoDetailPresentation.name
        todo.detail = todoDetailPresentation.detail
        todo.finishTime = todoDetailPresentation.finishTime
         
        saveContext()
    }
    
   func updateTodo(todoDetailModel: ToDoDetailModel, todo : Entity) {
        
        todo.name = todoDetailModel.name
        todo.detail = todoDetailModel.detail
        todo.finishTime = todoDetailModel.finishTime
        
        saveContext()
    }
    
    func deleteTodo(todo : Entity) {
        
        do {
            context.delete(todo)
            try context.save()
        }
        catch {
            // Handle Error
        }
    }
}
