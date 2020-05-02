//
//  AllApps.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 01/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


class AllAppsService {
    static let shared = AllAppsService()
    
    func fetchAllApps(completion: @escaping([AppModel]?,Error?)->()){
        guard  let url = URL(string: "https://api.euprogramador.app/app-store/v1/apps") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil,error)
                return
            }
            guard let data = data else{return}
            do{
                let apps = try JSONDecoder().decode([AppModel].self, from: data)
                
                completion(apps,nil)
                
            }catch{
                completion(nil,error)
                return
            }
            
        }.resume()
        
    }
}
