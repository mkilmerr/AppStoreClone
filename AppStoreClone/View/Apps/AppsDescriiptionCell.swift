//
//  AppsDescriiptionCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 27/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppsDescriptionCell:UICollectionViewCell{
    var app:AppModel!{
        didSet{
            if let app = app {
                descriptionLabel.text = app.descricao
            }
        }
    }
    let newsLabel:UILabel = .setupBoldLabel(title: "Novidades", fontSize: 24)
    let descriptionLabel:UILabel = .setupLabel(title: "Descricao", fontSize: 14,numberOfLines: 0)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let newsAndDescriptionStack = UIStackView(arrangedSubviews: [newsLabel,descriptionLabel])
        newsAndDescriptionStack.axis = .vertical
        newsAndDescriptionStack.spacing = 12
        
       
        addSubview(newsAndDescriptionStack)
        newsAndDescriptionStack.fillAllScreen(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
  
}
