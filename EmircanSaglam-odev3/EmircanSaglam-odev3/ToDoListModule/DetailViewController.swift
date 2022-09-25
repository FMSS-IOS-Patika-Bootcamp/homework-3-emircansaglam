//
//  DetailViewController.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var toDo: ToDoListItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let text = toDo?.text{
            titleLabel.text = text
        }
       
    }
    


    @IBAction func buttonClicked(_ sender: Any) {
        if let status = toDo?.checkBox {
            if !status {
                print("false")
                toDo?.checkBox = true
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                do {
                    try context.save()
                }catch {
                    print(error.localizedDescription)
                }
            }else {
                toDo?.checkBox = false
                print("false")
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                do {
                    try context.save()
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
        self.dismiss(animated: true)
    }
}
