//
//  CommentCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 28/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


class CommentCell:UICollectionViewCell{
    
    let titleRating:UILabel = .setupBoldLabel(title: "Muito legal!", fontSize: 14)
    
    let opinionDescription:UILabel = .setupLabel(title: "O app me deixou muito feliz com sua perfomace e funcionalidades", fontSize: 12, numberOfLines: 0)
    
    let imageRating:UIImageView = {
        let image = UIImageView()
        image.setHeightAndWidth(size: .init(width: 120, height: 24))
//        image.frame.size = .init(width: 20, height: 24)
        image.contentMode = .scaleAspectFit
       
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.grayGetButton
        layer.cornerRadius = 17
    
        imageRating.image = UIImage(named: "avaliacao-5")
        let titleStack = UIStackView(arrangedSubviews: [titleRating])
        titleStack.alignment = .top
        
        let headerRatingStack = UIStackView(arrangedSubviews: [titleStack,imageRating])
        headerRatingStack.axis = .horizontal
        
        let commentStackView = UIStackView(arrangedSubviews: [headerRatingStack,opinionDescription])
        
        commentStackView.axis  = .vertical
     
        
        addSubview(commentStackView)
        
        commentStackView.setAutoLayoutProperties(top: topAnchor, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
      
        
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
