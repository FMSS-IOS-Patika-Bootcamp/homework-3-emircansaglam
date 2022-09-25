//
//  ToDoListViewModel.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import Foundation

protocol ToDoListViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ toDoList: [ToDoListItem])
}


class ToDoListViewModel {
    
    private let model = ToDoListModel()
    
    weak var viewDelegate: ToDoListViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    
    
}

extension ToDoListViewModel: ToDoListModelProtocol {
    func didDataFetchProccesFinish(_ isSucces: Bool) {
        if isSucces {
            let toDoList = model.toDoList
            viewDelegate?.didCellItemFetch(toDoList)
        }
    }
}
