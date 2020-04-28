//
//  AppsDetailScreenshotCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 27/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppsDetailScreenshotCell:UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    let screenshotID = "screenshotID"
    let previewLabel:UILabel = .setupBoldLabel(title: "Pré-visualização", fontSize: 24)
    
    var collectionView:UICollectionView!
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: screenshotID)
        
        addSubview(previewLabel)
        addSubview(collectionView)
        
        previewLabel.setAutoLayoutProperties(top: topAnchor, trailing: trailingAnchor, bottom: nil, leading: leadingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        collectionView.setAutoLayoutProperties(top: topAnchor, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor, padding: .init(top: 35, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension AppsDetailScreenshotCell{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotID, for: indexPath) as! ScreenshotCell
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 220, height: collectionView.bounds.height)
    }
    
}


class ScreenshotCell:UICollectionViewCell{
    let screenshotImage:UIImageView = .setupScreenshotImages()
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        addSubview(screenshotImage)
        screenshotImage.fillAllScreen()
        screenshotImage.image = UIImage(named: "screenshot")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
