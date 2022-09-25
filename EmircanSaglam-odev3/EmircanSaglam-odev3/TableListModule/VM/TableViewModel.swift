//
//  TableViewModel.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import Foundation

protocol TableViewModelProtocol: AnyObject{
    func didCellItemFetch(_ items: [TableCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}

class TableViewModel {
    
    private let model = TableModel()
    
    weak var viewDelegate: TableViewModelProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    
}

private extension TableViewModel {
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [TableCellViewModel]{
        return posts.map { .init(title: $0.title, desc: $0.body)}
    }
}

extension TableViewModel: TableModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        
        if isSuccess {
            let posts = model.posts
            let cellModels = makeViewBasedModel(posts)
            viewDelegate?.didCellItemFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }
        
        
        
        
    }
}
