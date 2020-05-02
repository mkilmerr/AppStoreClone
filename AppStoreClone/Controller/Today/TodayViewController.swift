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
    let headerID = "headerID"
    var todayAppArray:[TodayApp]?
    var today:[AppModel] = []
    
    
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
        collectionView.register(TodayHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        navigationController?.navigationBar.isHidden = true
        self.addToday()
        self.fetchAllApps()
        
    }
    
    
}
//MARK:- Fetch Today App

extension TodayViewController{
    
    
    func addToday(){
        TodayAppService.shared.fetchTodayApp { (app, error) in
            if let app = app {
                DispatchQueue.main.async{
                    self.todayAppArray = app
                    self.collectionView.reloadData()
                    
                }
                
            }
        }
    }
}

//MARK:- CollectionView Methods

extension TodayViewController{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: 90)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! TodayHeader
    
     

        return header
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todayAppArray?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item < 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellID, for: indexPath) as! TodayCell
            cell.todayApp = self.todayAppArray?[indexPath.item]
            
            
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TodayMultipleCell
            
            cell.todayApp = self.todayAppArray?[indexPath.item]
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 48, height:view.bounds.width + 48)
    }
    func fetchAllApps(){
        AllAppsService.shared.fetchAllApps { (apps, error) in
            if let apps = apps {
                self.today = apps
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.tabBarController?.tabBar.isHidden = true
        if let cellClicked = collectionView.cellForItem(at: indexPath){
            if let frame = cellClicked.superview?.convert(cellClicked.frame, to: nil){
                let todayModal = TodayModal()
                
                
                todayModal.modalPresentationStyle = .overCurrentContext
                todayModal.callback = {
                    self.tabBarController?.tabBar.isHidden = false
                }
                let nav = UINavigationController(rootViewController: todayModal)
                nav.modalPresentationStyle = .overCurrentContext
                nav.view.backgroundColor = .clear
                
                self.present(nav, animated: false){
                    todayModal.frame = frame
                    todayModal.todayApp = self.todayAppArray![indexPath.item]
                    
                }
            }
            
            
        }
    }
}
