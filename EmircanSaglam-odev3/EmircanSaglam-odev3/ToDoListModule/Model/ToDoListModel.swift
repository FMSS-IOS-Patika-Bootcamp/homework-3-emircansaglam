//
//  ToDoListModel.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import Foundation
import CoreData
import UIKit

protocol ToDoListModelProtocol: AnyObject {
    func didDataFetchProccesFinish(_ isSucces: Bool)
}

class ToDoListModel {
    weak var delegate: ToDoListModelProtocol?
    
    var toDoList: [ToDoListItem] = []
    
    func fetchData(){
        let fetchRequest: NSFetchRequest <ToDoListItem> = ToDoListItem.fetchRequest()
        do {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            var results = try context.fetch(fetchRequest)
            self.toDoList = results
            delegate?.didDataFetchProccesFinish(true)
        }catch {
            print(error.localizedDescription)
            delegate?.didDataFetchProccesFinish(false)
        }
        
    }
    
}
