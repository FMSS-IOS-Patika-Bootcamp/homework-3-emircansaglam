//
//  tableModel.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import Foundation

protocol TableModelProtocol: AnyObject{
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class TableModel {
    
    weak var delegate: TableModelProtocol?
    
    var posts: [Post] = []
    
    func fetchData() {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts") else {
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
                self?.posts = try jsonDecoder.decode([Post].self, from: data)
                self?.delegate?.didDataFetchProcessFinish(true)
            }catch {
                print("json Serialization Error")
            }
        }
        
        task.resume()
    }
    
}
