//
//  UIColor.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


extension UIColor{
    convenience init(r: CGFloat,g:CGFloat,b:CGFloat){
        self.init(red:r/255, green: g/255, blue: b/255, alpha:1)
    }
    
    static let blueGetButton = UIColor(r: 0, g: 118, b: 244)
    static let grayGetButton = UIColor(white: 0.95, alpha: 1)
}
