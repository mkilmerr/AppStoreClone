//
//  TodayMultipleTableCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 01/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage

class TodayMultipleTableCell: UITableViewCell {
    
    var app:AppModel?{
        didSet{
            if let app = app {
                appImage.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                appName.text = app.nome
                companyName.text = app.empresa
            }
        }
    }
    let appImage:UIImageView = .setupIconImageView(height: 48, width: 48)
    let appName:UILabel = .setupBoldLabel(title: "App nome", fontSize: 16)
    let companyName:UILabel = .setupLabel(title: "Nome da empresa", fontSize: 14)
    let getButton:UIButton = .setupGetButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        let headerStack = UIStackView(arrangedSubviews: [appName,companyName])
        headerStack.axis = .vertical
        headerStack.spacing = 2
        
        let stackView = UIStackView(arrangedSubviews: [appImage, headerStack,getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillAllScreen(padding: .init(top: 14, left: 0, bottom: 14, right: 14))
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
