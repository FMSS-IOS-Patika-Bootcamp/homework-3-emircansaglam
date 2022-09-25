//
//  CollectionEntity.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import Foundation
struct CollectionCellViewModel {
    var Image: String
}

struct PostImage: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
