//
//  AppsDetailScreenshot.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 27/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppsDetailScreenshotViewController:UICollectionViewController,UICollectionViewDelegateFlowLayout{
    let id = "id"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: id)
        
    }
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
       
        return cell
    }
}
