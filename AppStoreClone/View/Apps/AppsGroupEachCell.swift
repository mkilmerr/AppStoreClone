//
//  AppsGroupEachCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 23/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage

class AppsGroupEachCell:UICollectionViewCell{
    var apps:AppModel?{
        didSet{
            let indicator = UIActivityIndicatorView.init(style: .large)
            indicator.startAnimating()
            indicator.center = center
                
            if let apps = apps {
                iconImage.sd_setImage(with: URL(string:apps.iconeUrl), completed: nil)
                appName.text = apps.nome
                companyName.text = apps.empresa
                
                indicator.stopAnimating()
            }
            
            addSubview(indicator)
        }
    }
    let iconImage:UIImageView = .setupIconImageView()
    let appName:UILabel = .setupLabel(title: "nome do app", fontSize: 18)
    let companyName:UILabel = .setupLabel(title: "nome da empresa", fontSize: 14)
    let getButton:UIButton = .setupGetButton()
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 80, y: bounds.height, width: bounds.width - 80, height: 0.8)
        bottomLine.backgroundColor = UIColor.bottomLine.cgColor
        layer.addSublayer(bottomLine)
    
        let appAndCompanyStack = UIStackView(arrangedSubviews: [appName,companyName])
        appAndCompanyStack.spacing = 2
        appAndCompanyStack.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImage,appAndCompanyStack,getButton])
        stackView.spacing = 8
        stackView.alignment = .center
        addSubview(stackView)
        
        stackView.setAutoLayoutProperties(top: topAnchor, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
