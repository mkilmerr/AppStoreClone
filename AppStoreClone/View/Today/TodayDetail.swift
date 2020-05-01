//
//  TodayDetail.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 30/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayDetail: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.addHeader()
    }
    
    
    func addHeader(){
        let header = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))
        
        let todayCell = TodayCell()
        todayCell.layer.cornerRadius = 0
        
        
        
        header.addSubview(todayCell)
        todayCell.fillAllScreen()
        
        self.tableView.tableHeaderView = header
    }
}
