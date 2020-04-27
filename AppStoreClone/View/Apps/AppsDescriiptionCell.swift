//
//  AppsDescriiptionCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 27/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppsDescriptionCell:UICollectionViewCell{
    let newsLabel:UILabel = .setupLabel(title: "Novidades", fontSize: 24)
    let descriptionLabel:UILabel = .setupLabel(title: "Hello hello Hello helloHello helloHello helloHello helloHello helloHello helloHello hello", fontSize: 18,numberOfLines: 0)
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
