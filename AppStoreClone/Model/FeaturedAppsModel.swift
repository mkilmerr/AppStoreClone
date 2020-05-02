//
//  FeaturedApps.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 21/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


struct FeaturedAppsModel:Decodable{
    var id:Int
    var nome:String
    var empresa:String
    var imagemUrl:String
    var descricao:String
}

