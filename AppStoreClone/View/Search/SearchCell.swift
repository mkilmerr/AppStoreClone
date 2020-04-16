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
    let firstScreenshot:UIImageView = .setupScreenshotImages()
    let secondScreenshot:UIImageView = .setupScreenshotImages()
    let thirdScreenshot:UIImageView = .setupScreenshotImages()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        let titleAndCompanyStackView = UIStackView(arrangedSubviews: [titleLabel,companyLabel])
     
        titleAndCompanyStackView.axis = .vertical
        titleAndCompanyStackView.spacing = 8
        
        let headerStackView = UIStackView(arrangedSubviews: [iconImageView,titleAndCompanyStackView,getButton])
        headerStackView.spacing = 12
        headerStackView.alignment = .center
        
        let screenShootsStackView = UIStackView(arrangedSubviews: [firstScreenshot,secondScreenshot,thirdScreenshot])
        screenShootsStackView.distribution = .fillEqually
        screenShootsStackView.spacing = 16
        
        let globalStackView = UIStackView(arrangedSubviews: [headerStackView,screenShootsStackView])
        addSubview(globalStackView)
        globalStackView.axis = .vertical
        globalStackView.distribution = .fillEqually
        globalStackView.fillAllScreen(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
