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

/*
 "id": 4,
 "titulo": "Cumpre o que promete",
 "avaliacao": 3,
 "descricao": "Ao contrário do que se acredita, Lorem Ipsum não é simplesmente um texto randômico. Com mais de 2000 anos, suas raízes podem ser encontradas em uma obra de literatura latina clássica datada de 45 AC."
 */
