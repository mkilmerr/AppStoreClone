//
//  AppsThatWeLoveModel.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 21/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


struct AppsThatWeLoveModel:Decodable{
    let id:String
    let titulo:String
    let apps:[AppModel]
    
}


/*
 "id": "apps-que-amamos",
    "titulo": "Apps que amamos",
    "apps": [
 */
