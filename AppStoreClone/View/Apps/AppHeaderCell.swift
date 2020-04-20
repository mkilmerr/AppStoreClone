//
//  AppHeaderCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 20/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppHeaderCell:UICollectionViewCell{
    let companyName:UILabel = .setupLabel(title: "Nome da Empresa", fontSize: 12)
    let descriptionApp:UILabel = .setupLabel(title: "Descrição", fontSize: 20, numberOfLines: 2)
    let imageApp:UIImageView = .setupScreenshotImages()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.companyName.textColor = .blueGetButton
        
        let stackView = UIStackView(arrangedSubviews: [companyName,descriptionApp,imageApp])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        
        stackView.fillAllScreen(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
