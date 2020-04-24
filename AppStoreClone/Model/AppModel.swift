//
//  AppModel.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 16/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct AppModel:Decodable{
    var id:Int
    var nome:String
    var empresa:String
    var avaliacao:String
    var iconeUrl:String
    var screenshotUrls:[String]?
}




