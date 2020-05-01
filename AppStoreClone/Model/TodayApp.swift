//
//  TodayApp.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 01/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

struct TodayApp{
    let id:Int
    let categoria:String
    let titulo:String
    let imagemUrl:String?
    let descricao:String?
    let backgroundColor:String?
    var apps:[AppModel]?
}
