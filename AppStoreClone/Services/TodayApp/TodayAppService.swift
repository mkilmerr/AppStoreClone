//
//  TodayAppService.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 01/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayAppService{
    static let shared = TodayAppService()
    
    func fetchTodayApp(completion : @escaping([TodayApp]?, Error?)->()){
        var todayAppArray:[TodayApp] = [
            
            TodayApp(id: 1, categoria: "VIAGEM", titulo: "Explore o mundo \n sem medo", imagemUrl: "destaque-1", descricao: "Podemos viajar o mundo em busca de beleza, mas nunca a encontraremos se não a carregarmos dentro de nós", backgroundColor:"#FFFFFF",apps:nil),
            
            TodayApp(id: 2, categoria: "PRATIQUE HOJE", titulo: "Mantenha corpo \ne mente saudável", imagemUrl: "destaque-2", descricao: "Quanto mais se rema, maiores são as chances de pegar as melhores ondas, tanto no surf quanto na vida", backgroundColor: "#69CCE0",apps:nil)
            
        ]
        
        AllAppsService.shared.fetchAllApps { (apps, error) in
            if let apps = apps {
                todayAppArray.append(
                    
                    TodayApp(id: 3,
                             categoria: "LISTA DO DIA",
                             titulo: "Pedale melhor com \nApple Watch",
                             imagemUrl: nil,
                             descricao: nil,
                             backgroundColor: nil,
                             apps: apps)
                )
                
            }
             completion(todayAppArray,nil)
        }
        
       
    }
}
