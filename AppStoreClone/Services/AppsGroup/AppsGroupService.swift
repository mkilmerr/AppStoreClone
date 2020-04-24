//
//  AppsGroupService.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 23/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


class AppsGroupService{
    static let API  = "https://api.euprogramador.app/app-store/v1/"
    static let shared = AppsGroupService()
    
    
    func fetchGroups(type:String, completion: @escaping(AppsGroup?,Error?)->()){
        let url = URL(string: "\(AppsGroupService.API)/apps/\(type)")
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(nil,error)
                    return
                }
                    do{
                        guard let data = data else{return}
                        let dataReceive = try JSONDecoder().decode(AppsGroup.self, from: data)
                        completion(dataReceive,nil)
                    }catch{
                        completion(nil,error)
                        return
                    
                }
            }.resume()
        }
    }
}
