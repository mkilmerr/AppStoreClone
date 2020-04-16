//
//  SearchService.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 16/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import Foundation


class SearchService{
    
    static let sharedSearchService = SearchService()
    
    func fetchApp(textInput:String){
        let url = URL(string: "https://api.euprogramador.app/app-store/v1/apps?search=uber")
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, res, err) in
                if err != nil {
                    print(err!)
                    return
                }
                
                do{
                    guard let dataReceive = data else{return}
                    let jsonDecoder = try JSONDecoder().decode([AppModel].self, from: dataReceive)
                    print(jsonDecoder)
                 
                }catch let err{
                    print(err)
                }
                
            }.resume()
        }
        
    }
}
