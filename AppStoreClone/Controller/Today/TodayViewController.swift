//
//  TodayViewController.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 25/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    let todayCellID = "TODAY"
    init() {
        super.init(collectionViewLayout:UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: todayCellID)
        
        navigationController?.navigationBar.isHidden = true
    }
}
    
extension TodayViewController{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellID, for: indexPath) as! TodayCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 48, height:view.bounds.width + 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cellClicked = collectionView.cellForItem(at: indexPath){
            if let frame = cellClicked.superview?.convert(cellClicked.frame, to: nil){
               let todayModal = TodayModal()
                navigationController?.navigationBar.isHidden = true
                todayModal.modalPresentationStyle = .overCurrentContext
                self.present(todayModal, animated: false){
                    todayModal.frame = frame
                    todayModal.animation()
                }
            }
            
            
        }
    }
}
