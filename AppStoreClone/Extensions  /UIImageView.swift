//
//  UIImageView.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

extension UIImageView{
    
    static func setupIconImageView(height:CGFloat = 64, width:CGFloat = 64) -> UIImageView{
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.setHeightAndWidth(size: .init(width: width, height: height))
        iconImageView.layer.borderWidth = 0.5
        iconImageView.backgroundColor = .purple
        iconImageView.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        iconImageView.layer.cornerRadius = 12
        iconImageView.clipsToBounds = true
        
        return iconImageView
    }
    
    static func setupScreenshotImages() -> UIImageView{
        let screenshot = UIImageView()
        screenshot.translatesAutoresizingMaskIntoConstraints = false
        screenshot.backgroundColor = .purple
        screenshot.layer.cornerRadius = 12
        screenshot.layer.borderColor = UIColor(white: 0.5, alpha: 1).cgColor
        screenshot.clipsToBounds = true
        screenshot.contentMode = .scaleAspectFill
        return screenshot
        
    }
    
    static func setupFeaturedImage(name:String? = nil) -> UIImageView{
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        if let name = name {
            image.image = UIImage(named: name)
        }
        image.contentMode = .scaleAspectFit
       

        
        return image
    }
    
    static func setupTodayUserImage() -> UIImageView{
        let image = UIImageView()
        image.layer.cornerRadius = 18
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "user-image")
        image.clipsToBounds = true
        image.setHeightAndWidth(size: .init(width: 36, height: 36))
        
        return image
    }
    
}
