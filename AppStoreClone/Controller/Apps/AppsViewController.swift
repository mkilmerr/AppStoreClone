//
//  AppsViewController.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 17/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppsViewController:UICollectionViewController,UICollectionViewDelegateFlowLayout{
    let collectionID = "collectionID"
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self,forCellWithReuseIdentifier: collectionID)
    }
    
}

extension AppsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:collectionID , for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
   
}
