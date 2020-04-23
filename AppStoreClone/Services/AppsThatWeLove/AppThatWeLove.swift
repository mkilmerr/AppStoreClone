//
//  AppThatWeLove.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 21/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


class AppThatWeLove{
    static let shared = AppThatWeLove()
    
    func fetchAppsWeThatLove(completion : @escaping ([AppsThatWeLoveModel]?,Error?)->()){
        let url = URL(string: "https://api.euprogramador.app/app-store/v1//apps/apps-que-amamos")
        if let url =  url{
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(nil,error)
                    return
                }
                
                do{
                    if let data = data {
                        let appsThatWeLove = try JSONDecoder().decode([AppsThatWeLoveModel].self, from: data)
                        completion(appsThatWeLove,nil)
                    }
                }catch{
                    completion(nil,error)
                    return
                }
            }.resume()
        }
    }
}
