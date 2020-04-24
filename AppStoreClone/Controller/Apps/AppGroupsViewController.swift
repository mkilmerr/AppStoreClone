//
//  AppGroupsViewController.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 23/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


class AppsGroupViewController:UICollectionViewController,UICollectionViewDelegateFlowLayout{
    let cellGroupsID = "ID"
    var appsGroupsArray:[AppsGroup] = []
    var apps:[AppModel] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.decelerationRate = .fast
        collectionView.showsVerticalScrollIndicator = false
       
        collectionView.register(AppsGroupEachCell.self, forCellWithReuseIdentifier: cellGroupsID)
        
    }
}

extension AppsGroupViewController{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.height/3 - 1 )
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellGroupsID, for: indexPath) as! AppsGroupEachCell
        cell.apps = self.apps[indexPath.item]
        return cell
    }
}
