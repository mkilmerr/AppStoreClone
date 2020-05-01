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
    let cellID = "cellID"
    var todayAppArray:[TodayApp]?
    init() {
        super.init(collectionViewLayout:UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: todayCellID)
        collectionView.register(TodayMultipleCell.self, forCellWithReuseIdentifier: cellID)
        navigationController?.navigationBar.isHidden = true
        self.addToday()
    }
    
    
    func addToday(){
        TodayAppService.shared.fetchTodayApp { (app, error) in
            if let app = app {
                self.todayAppArray = app
            }
        }
    }
    
    
    
}

extension TodayViewController{
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todayAppArray!.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.item)
        if indexPath.item < 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellID, for: indexPath) as! TodayCell
            cell.todayApp = self.todayAppArray?[indexPath.item]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TodayMultipleCell
           
          
            return cell
        }
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 48, height:view.bounds.width + 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < 2 {
        self.tabBarController?.tabBar.isHidden = true
        if let cellClicked = collectionView.cellForItem(at: indexPath){
            if let frame = cellClicked.superview?.convert(cellClicked.frame, to: nil){
                let todayModal = TodayModal()
                
                
                todayModal.modalPresentationStyle = .overCurrentContext
                todayModal.callback = {
                    self.tabBarController?.tabBar.isHidden = false
                }
                self.present(todayModal, animated: false){
                    todayModal.frame = frame
                    todayModal.todayApp = self.todayAppArray![indexPath.item]
                    
                }
            }
            
            
        }
        } }
}
