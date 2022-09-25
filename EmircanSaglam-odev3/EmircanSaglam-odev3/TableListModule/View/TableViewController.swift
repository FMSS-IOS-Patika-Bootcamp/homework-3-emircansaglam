//
//  ViewController.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 24.09.2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = TableViewModel()
    private var items: [TableCellViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
    }
}

extension TableViewController: TableViewModelProtocol {
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
    
    func didCellItemFetch(_ items: [TableCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


private extension TableViewController {
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.postTitleLabel.text = items[indexPath.row].title
        cell.postDescLabel.text = items[indexPath.row].desc
        return cell
    }
    
}
