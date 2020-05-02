//
//  AppsThatWeLoveModel.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 21/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


struct AppsGroup :Decodable{
    let id:String
    let titulo:String
    let apps:[AppModel]?
}

