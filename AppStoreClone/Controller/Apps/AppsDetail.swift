//
//  AppsDetail.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 25/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class AppsDetail:UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    let detailID = "ID"
    let descriptionID = "DID"
    let screenshot = "SCREENSHOT_ID"
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppsDetailHeader.self, forCellWithReuseIdentifier: detailID)
        collectionView.register(AppsDescriptionCell.self, forCellWithReuseIdentifier: descriptionID)
        collectionView.register(AppsDetailScreenshotCell.self, forCellWithReuseIdentifier: screenshot)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("->>>",indexPath.item)
        if indexPath.item == 0 {
            print("hihihi")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailID, for: indexPath) as! AppsDetailHeader
            cell.backgroundColor = .white
            return cell
        }
        if indexPath.item == 1 {
            print("oioi")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionID, for: indexPath) as! AppsDescriptionCell
            cell.backgroundColor = .white
            
            return cell
        }
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshot, for: indexPath) as! AppsDetailScreenshotCell
            cell.backgroundColor = .white
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width:CGFloat = view.bounds.width
        var height:CGFloat = 170
        if indexPath.item == 1 {
            let descriptionCell = AppsDescriptionCell(frame: .init(x: 0, y: 0, width: width, height: 1000))
            descriptionCell.layoutIfNeeded()
            let estimatedHeightCell = descriptionCell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = estimatedHeightCell.height
        }
        if indexPath.item == 2 {
            height = 550
        }
        return .init(width: width, height: height)
    }
}
