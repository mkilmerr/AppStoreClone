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


/*
 "id": 284882215,
 "nome": "Facebook",
 "empresa": "Facebook, Inc.",
 "imagemUrl": "https://api.euprogramador.app/app-store/v1/public/upload/capas/454638411-capa.jpeg",
 "descricao": "Manter-se com os amigos é mais rápido do que nunca."
 */
