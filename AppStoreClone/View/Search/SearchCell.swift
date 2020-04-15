//
//  SearchCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class SearchCell:UITableViewCell{
    let iconImageView:UIImageView = .setupIconImageView()
    let titleLabel:UILabel = .setupLabel(title: "Name of app", fontSize: 18, numberOfLines: 2)
    let companyLabel:UILabel = .setupLabel(title: "Company", fontSize: 14)
    let getButton:UIButton = .setupGetButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        let titleAndCompanyStackView = UIStackView(arrangedSubviews: [titleLabel,companyLabel])
        titleAndCompanyStackView.alignment = .center
        titleAndCompanyStackView.axis = .horizontal
        titleAndCompanyStackView.spacing = 8
        
        let headerStackView = UIStackView(arrangedSubviews: [iconImageView,titleAndCompanyStackView,getButton])
        headerStackView.spacing = 12
        headerStackView.alignment = .center
        
        addSubview(headerStackView)
        headerStackView.fillAllScreen(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
