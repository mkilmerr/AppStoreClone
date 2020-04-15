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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        let titleAndCompanyStackView = UIStackView(arrangedSubviews: [titleLabel,companyLabel])
        titleAndCompanyStackView.alignment = .center
        titleAndCompanyStackView.axis = .horizontal
        titleAndCompanyStackView.spacing = 8
        let stackView = UIStackView(arrangedSubviews: [iconImageView,titleAndCompanyStackView])
        stackView.spacing = 12
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillAllScreen()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
