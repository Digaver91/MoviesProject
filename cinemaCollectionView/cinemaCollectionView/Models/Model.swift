//
//  Model.swift
//  cinemaCollectionView
//
//  Created by Dmytro Gavrylov on 20.09.2022.
//

import Foundation

struct Movies: Codable {
    var id: String?
    var imgPath: String?
    var name: String?
    var raiting: String?
    var type: String?
    var duration: String?
}

