//
//  ToDoAddViewController.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import UIKit
import CoreData

class ToDoAddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

  
     @IBAction func addButtonClicked(_ sender: Any) {
         saveDataWithCoreData()
         
     }
    func saveDataWithCoreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "ToDoListItem", into: context)
        
        newPainting.setValue(textField.text, forKey: "text")
        do {
            try context.save()
            print("success")
            self.dismiss(animated: true, completion: nil)
        }catch {
            print("error")
        }
        self.dismiss(animated: true)
        
    }

}
