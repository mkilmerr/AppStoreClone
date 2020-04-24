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


/*
 "id": 849215105,
 "nome": "Voopter - Passagens Aéreas",
 "empresa": "Voopter",
 "avaliacao": "1,8 mil",
 "iconeUrl": "https://api.euprogramador.app/app-store/v1/public/upload/icones/849215105-icone.png",
 "screenshotUrls": [
 
 let id:Int
   let nome:String
   let empresa:String
   let avaliacao:String
   let iconeUrl:String
   let screenshotUrls:
 
 "id": "apps-que-amamos",
    "titulo": "Apps que amamos",
    "apps": [
        {
   
 */
