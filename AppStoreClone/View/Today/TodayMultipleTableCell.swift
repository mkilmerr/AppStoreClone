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
    var leadingConstraint:NSLayoutConstraint?
    var trailingConstraint:NSLayoutConstraint?
    
    let appImage:UIImageView = .setupIconImageView(height: 48, width: 48)
    let appName:UILabel = .setupBoldLabel(title: "App nome", fontSize: 16)
    let companyName:UILabel = .setupLabel(title: "Nome da empresa", fontSize: 14)
    let getButton:UIButton = .setupGetButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        let headerStack = UIStackView(arrangedSubviews: [appName,companyName])
        headerStack.axis = .vertical
        headerStack.spacing = 2
        
        let stackView = UIStackView(arrangedSubviews: [appImage, headerStack,getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
//        stackView.fillAllScreen(padding: .init(top: 14, left: 0, bottom: 14, right: 14))
        stackView.setAutoLayoutProperties(top: topAnchor, trailing: nil, bottom: bottomAnchor, leading: nil, padding: .init(top: 14, left: 0, bottom: 14, right: 14))
        
        self.leadingConstraint = stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        self.trailingConstraint = stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        
        self.leadingConstraint?.isActive = true
        self.trailingConstraint?.isActive = true 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
