//
//  FeaturedApps.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 21/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class FeaturedApps{
    static let shared = FeaturedApps()
    
    func fetchFeaturedApps(completion: @escaping ([FeaturedAppsModel]?,Error?) ->()){
        guard let url = URL(string:  "https://api.euprogramador.app/app-store/v1/apps/apps-em-destaque") else{return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          
            if error != nil {
                completion(nil,error)
                return
            }
            
            do{
                guard let dataReceive = data else{return}
                let featuredApps = try JSONDecoder().decode([FeaturedAppsModel].self, from: dataReceive)
                completion(featuredApps,nil)
            }catch {
               completion(nil,error)
                return
            }
        }.resume()
    }
}
