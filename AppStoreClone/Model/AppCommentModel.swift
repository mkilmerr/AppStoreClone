//
//  AppCommentModel.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 29/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct AppCommentModel:Decodable{
    var id:Int
    var titulo:String
    var avaliacao:Int
    var descricao:String?
}
