//
//  UIGetButton.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


extension UIButton{
    
    static func setupGetButton() -> UIButton {
        let getButton = UIButton()
        getButton.backgroundColor = UIColor.grayGetButton
        getButton.setTitle("OBTER", for: .normal)
        getButton.setTitleColor(UIColor.blueGetButton, for: .normal)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        getButton.layer.cornerRadius = 16
        getButton.setHeightAndWidth(size: .init(width: 80, height: 32))
        return getButton
    }
}
