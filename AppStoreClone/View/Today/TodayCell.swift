//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 30/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayCell:UICollectionViewCell{
    
    var todayApp:TodayApp?{
        didSet{
            if let app = todayApp{
                category.text = app.categoria
                title.text = app.titulo
                imageFeatured.image = UIImage(named: app.imagemUrl!)
                backgroundColor = UIColor.init(hexString: app.backgroundColor!)
            }
        }
    }
    let category:UILabel = .setupLabel(title: "VIAGEM", fontSize: 18)
    let title:UILabel = .setupBoldLabel(title: "Explore o mundo\nsem medo", fontSize: 28)
    let imageFeatured:UIImageView = .setupFeaturedImage(name: "destaque-1")
    let descriptionFeatured:UILabel = .setupLabel(title: "Podemos viajar o mundo em busca de beleza, mas nunca a encontraremos se não a carregarmos dentro de nós", fontSize: 14, numberOfLines: 3)
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let boxView = UIView()
        boxView.clipsToBounds = true
        
        boxView.addSubview(imageFeatured)
        
        imageFeatured.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imageFeatured.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true
        imageFeatured.setHeightAndWidth(size: .init(width: bounds.width, height: 250))
        
        let stackView = UIStackView(arrangedSubviews: [category,title,boxView,descriptionFeatured])
        stackView.axis = .vertical
        stackView.spacing = 0
        
        addSubview(stackView)
        
//        stackView.fillAllScreen(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        stackView.setAutoLayoutProperties(top: self.safeAreaLayoutGuide.topAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
