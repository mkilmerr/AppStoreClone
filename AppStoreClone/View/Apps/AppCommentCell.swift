//
//  AppCommentCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 28/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppCommentCell:UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    let opinionsAndRatings:UILabel = .setupBoldLabel(title: "Opiniões e Avaliações", fontSize: 24)
    var collectionView:UICollectionView!
    let commentID = "COMMENT"
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
      
        collectionView.register(CommentCell.self, forCellWithReuseIdentifier: commentID)
        
        
        addSubview(opinionsAndRatings)
          
        opinionsAndRatings.setAutoLayoutProperties(top: topAnchor, trailing: trailingAnchor, bottom: nil, leading: leadingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(collectionView)
        
        collectionView.setAutoLayoutProperties(top: opinionsAndRatings.bottomAnchor, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension AppCommentCell{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: commentID, for: indexPath) as! CommentCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 40 , height:collectionView.bounds.height)
    }
}




