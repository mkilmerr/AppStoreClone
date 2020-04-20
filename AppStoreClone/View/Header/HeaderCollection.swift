//
//  HeaderCollection.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 20/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppHeader:UICollectionReusableView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    let headerID = "header"
    
    
    var collectionView:UICollectionView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: headerID)
         addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.fillAllScreen()
       
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

extension AppHeader{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let header = collectionView.dequeueReusableCell(withReuseIdentifier:headerID, for: indexPath) as! AppHeaderCell
       
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: bounds.width-40, height: bounds.width * 0.8)
    }
}

