//
//  AppsDetailScreenshotCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 27/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import SDWebImage
class AppsDetailScreenshotCell:UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    var app:AppModel!{
        didSet{
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }
    var appById:AppModel!
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

//MARK:- CollectionView Methods
extension AppsDetailScreenshotCell{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotID, for: indexPath) as! ScreenshotCell
      
        if let imageURL = self.app!.screenshotUrls?[indexPath.item]{
            cell.screenshotImage.sd_setImage(with: URL(string: imageURL), completed: nil)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 220, height: collectionView.bounds.height)
    }
    
}

//MARK:- ScreenshotCell Images
class ScreenshotCell:UICollectionViewCell{
    let screenshotImage:UIImageView = .setupScreenshotImages()
    var app:AppModel!
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        addSubview(screenshotImage)
        screenshotImage.fillAllScreen()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
