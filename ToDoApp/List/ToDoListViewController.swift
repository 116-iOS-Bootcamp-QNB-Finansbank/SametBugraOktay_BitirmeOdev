//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by Samet Bugra Oktay on 19.10.2021.
//

import UIKit

class ToDoListViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {



    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
  
    
    var todoLists: [ToDoModel] = []
    var filteredTodoLists: [ToDoModel] = []
    
    
    
    var todolar : Entity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.reloadData()
        
        
    }
    
    

  
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let todos = CoreDataManager.instance.getTodoList()
            
            
            return todos.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath)
            
            let gettodo = CoreDataManager.instance.getTodoList()
            
            
            cell.textLabel?.text = gettodo[indexPath.row].name
            
            
            return cell
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            filteredTodoLists = []
            if (searchText == ""){
                filteredTodoLists = todoLists
            } else {
                for todo in todoLists {
                    if (todo.title.lowercased().contains(searchText.lowercased())){
                        filteredTodoLists.append(todo)
                    }
                }
            }
            self.tableView.reloadData()
        }
    
    
}
