//
//  ViewController.swift
//  CoreDataToDo
//
//  Created by Василий on 15.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World"
        return cell
        
    }
    
    
    
    
    
    
    // Core Data
    
    func getAllItems() {
        do{
            models = try context.fetch(ToDoListItem.fetchRequest())
        }
        catch {
            //error
        }
    }
    
    func createItem(name: String) {
        
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            
        }
        catch {
            
        }
        
    }
    
    func deleteItem(item: ToDoListItem) {
    
        context.delete(item)
        
        do {
            try context.save()
            
        }
        catch {
            
        }
    }
    
    func utdateItem(item: ToDoListItem, newName: String) {

        item.name = newName
        
        do {
            try context.save()
            
        }
        catch {
            
        }
    }

}


