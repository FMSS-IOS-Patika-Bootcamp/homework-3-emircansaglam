//
//  CollectionViewModel.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import Foundation

protocol CollectionViewModelProtocol: AnyObject {
    func didCellImageFetch(_ items: [CollectionCellViewModel])
    func showEmptyView()
    func hideEmptyView()
}

class CollectionViewModel {
    
    private let model = CollectionModel()
    
    weak var viewDelegate: CollectionViewModelProtocol?
    
    init() {
        model.delegate = self
    }
    func didViewLoad() {
        model.fetchData()
    }
    
}

private extension CollectionViewModel {
    func makeViewBasedModel(_ posts: [PostImage]) -> [CollectionCellViewModel] {
        return posts.map { .init(Image: $0.thumbnailUrl) }
    }
}

extension CollectionViewModel: CollectionModelProtocol {
    func didDataFetchProcessFinish(_ isSucces: Bool) {
        if isSucces {
            let images = model.Images
            let cellModels = makeViewBasedModel(images)
            viewDelegate?.didCellImageFetch(cellModels)
            viewDelegate?.hideEmptyView()
        } else {
            viewDelegate?.showEmptyView()
        }
    }
}
