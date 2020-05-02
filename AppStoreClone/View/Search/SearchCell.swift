//
//  SearchCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage
class SearchCell:UITableViewCell{
    
    var apps:AppModel!{
        didSet{
            
            titleLabel.text = apps.nome
            companyLabel.text = apps.empresa
            iconImageView.sd_setImage(with: URL(string: apps.iconeUrl), completed: nil)
            
            if let screenshots = apps.screenshotUrls {
                if screenshots.count > 0 {
                    self.firstScreenshot.sd_setImage(with: URL(string: screenshots[0]), completed: nil)
                }
                if screenshots.count > 1 {
                    self.secondScreenshot.sd_setImage(with: URL(string: screenshots[1]), completed: nil)
                }
                if screenshots.count > 2 {
                    self.thirdScreenshot.sd_setImage(with: URL(string: screenshots[2]), completed: nil)
                }
                
            }
            
        }
    }
    
    let iconImageView:UIImageView = .setupIconImageView()
    let titleLabel:UILabel = .setupLabel(title: "Name of app", fontSize: 18, numberOfLines: 2)
    let companyLabel:UILabel = .setupLabel(title: "Company", fontSize: 14,numberOfLines: 0)
    let getButton:UIButton = .setupGetButton()
    let firstScreenshot:UIImageView = .setupScreenshotImages()
    let secondScreenshot:UIImageView = .setupScreenshotImages()
    let thirdScreenshot:UIImageView = .setupScreenshotImages()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        self.selectionStyle = .none
        
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

