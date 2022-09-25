//
//  ToDoViewController.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import UIKit
import CoreData

class ToDoViewController: UIViewController{
    
    
    
    lazy var viewModel = ToDoListViewModel()
    var toDoList: [ToDoListItem] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.didViewLoad()
        self.tableView.reloadData()
    }
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ToDoViewController: ToDoListViewModelViewProtocol {
    func didCellItemFetch(_ toDoList: [ToDoListItem]) {
        self.toDoList = toDoList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! ToDoTableViewCell
        
        cell.toDoLabel.text = (toDoList.map {$0.text!})[indexPath.row]
        if toDoList[indexPath.row].checkBox == true {
            cell.statusImage.image = UIImage(systemName: "checkmark.square")
        }else {
            cell.statusImage.image = UIImage(systemName: "square")
        }
       
        
        return cell
    }
}
extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        destinationVc.toDo = self.toDoList[indexPath.row]
        self.present(destinationVc, animated: true)
    }
}
