//
//  UILabel.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

extension UILabel{
    
    static func setupLabel(title:String,fontSize:CGFloat,numberOfLines:Int = 1) -> UILabel{
        let label = UILabel()
        label.text = title 
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        
        return label
    }
    
    static func setupLabelGroup(title:String,fontSize:CGFloat,numberOfLines:Int=1) -> UILabel{
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        
        return label
    }
    
    static func setupBoldLabel(title:String,fontSize:CGFloat,numberOfLines:Int = 1) -> UILabel{
        let label = UILabel()
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        
        return label
    }
    
}
