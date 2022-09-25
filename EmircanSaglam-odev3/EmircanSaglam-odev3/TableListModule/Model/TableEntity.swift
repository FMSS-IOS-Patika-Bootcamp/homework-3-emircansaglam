//
//  TableEntity.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import Foundation

struct TableCellViewModel {
    var title: String?
    var desc: String?
}

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
