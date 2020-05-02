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
    let commentdID = "COMMENT"
    var loading:Bool = true
    var app:AppModel!
    
    var appID:Int!{
        didSet{
            self.fetchID(id: appID)
        }
    }
    
    
    let activityLoad:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        
        activity.hidesWhenStopped = true
        
        return activity
    }()
    
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
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AppsDetailHeader.self, forCellWithReuseIdentifier: detailID)
        collectionView.register(AppsDescriptionCell.self, forCellWithReuseIdentifier: descriptionID)
        collectionView.register(AppsDetailScreenshotCell.self, forCellWithReuseIdentifier: screenshot)
        collectionView.register(AppCommentCell.self, forCellWithReuseIdentifier: commentdID)
        view.addSubview(activityLoad)
        activityLoad.center = self.view.center
        activityLoad.startAnimating()
    }
    
}

//MARK:- CollectionView Methods

extension AppsDetail{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailID, for: indexPath) as! AppsDetailHeader
            cell.backgroundColor = .white
            cell.app = self.app
            self.appID = cell.app.id
            return cell
        }
        if indexPath.item == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionID, for: indexPath) as! AppsDescriptionCell
            cell.backgroundColor = .white
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshot, for: indexPath) as! AppsDetailScreenshotCell
            cell.backgroundColor = .white
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: commentdID, for: indexPath) as! AppCommentCell
            cell.app = self.app
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.loading ? 1 : 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width:CGFloat = view.bounds.width
        var height:CGFloat = 170
        if indexPath.item == 1 {
            let descriptionCell = AppsDescriptionCell(frame: .init(x: 0, y: 0, width: width, height: 1000))
            descriptionCell.app = self.app
            descriptionCell.layoutIfNeeded()
            let estimatedHeightCell = descriptionCell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = estimatedHeightCell.height
        }
        if indexPath.item == 2 {
            height = 550
        }
        
        if indexPath.item == 3{
            height = 280
        }
        
        return .init(width: width, height: height)
    }
}

//MARK:- PopularView and Fetch App By ID

extension AppsDetail{
    func popularView(_ app: AppModel){
        self.app = app
    }
    
    
    
    func fetchID(id:Int){
        
        AppByIDService.shared.fetchByID(id: id) { (appByID, error) in
            if error != nil {
                return
            }
            if let app = appByID {
                DispatchQueue.main.async {
                    self.activityLoad.stopAnimating()
                    self.app = app
                    self.loading = false
                    self.collectionView.reloadData()
                    
                }
                
            }
        }
    }
}
