//
//  CollectionModel.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import Foundation

protocol CollectionModelProtocol: AnyObject {
    func didDataFetchProcessFinish(_ isSucces: Bool)
}


class CollectionModel {
    weak var delegate: CollectionModelProtocol?
    
    var Images: [PostImage] = []
    
    func fetchData() {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else {
            delegate?.didDataFetchProcessFinish(false)
            return
        }
        var request: URLRequest = .init(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil else {
                self?.delegate?.didDataFetchProcessFinish(false)
                return
            }
            guard let data = data else {
                self?.delegate?.didDataFetchProcessFinish(false)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                self?.Images = try jsonDecoder.decode([PostImage].self, from: data)
                self?.delegate?.didDataFetchProcessFinish(true)
            }catch {
                print("JSon Serialization Error")
            }
            
        }
        task.resume()
        
    }
}
