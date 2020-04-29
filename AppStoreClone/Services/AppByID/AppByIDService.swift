//
//  AppByIDService.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 29/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation

class AppByIDService{
    static let shared =  AppByIDService()
    static let API  = "https://api.euprogramador.app/app-store/v1/"
    
    func fetchByID(id:Int, completion: @escaping(AppModel?,Error?)->() ){
        let url = URL(string: "\(AppByIDService.API)/apps/\(id)")
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(nil,error)
                    return
                }
                do{
                    guard let data = data else{return}
                    let appByID = try JSONDecoder().decode(AppModel.self, from: data)
                    completion(appByID,nil)
                    
                }catch{
                    completion(nil,error)
                    return
                }
                
            }.resume()
        }
    }
}
