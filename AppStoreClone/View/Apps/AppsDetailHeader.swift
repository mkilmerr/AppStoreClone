//
//  AppsDetailHeader.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 25/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage

class AppsDetailHeader:UICollectionViewCell{
    
    var app:AppModel!{
        didSet{
            if let app = app {
                iconImage.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                appName.text = app.nome
                companyname.text = app.empresa
            }
            
        }
    }
    let iconImage:UIImageView = .setupIconImageView(height: 128, width: 128)
    let appName:UILabel = .setupLabel(title: "app name", fontSize: 20,numberOfLines: 0)
    let companyname:UILabel = .setupLabel(title: "company name", fontSize: 14,numberOfLines: 0)
    let getButton:UIButton = .setupGetButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImage.image = UIImage(named: "AppIcon")
        let getButtonStackView = UIStackView(arrangedSubviews: [getButton,UIView()])
        let appAndCompany = UIStackView(arrangedSubviews: [appName,companyname,getButtonStackView])
        appAndCompany.spacing = 12
        appAndCompany.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImage,appAndCompany])
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.axis = .horizontal
        
        addSubview(stackView)
        stackView.fillAllScreen(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
   
    
}
