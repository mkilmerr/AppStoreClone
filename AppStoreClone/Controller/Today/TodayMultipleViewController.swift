//
//  TodayMultipleViewController.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 01/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayMultipleViewController:UITableViewController{
    var todayApp:TodayApp?
    let cellID = "cellid"
    var handleClick:((AppModel)->())?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        tableView.register(TodayMultipleTableCell.self, forCellReuseIdentifier: cellID)
    }
}


extension TodayMultipleViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todayApp?.apps?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TodayMultipleTableCell
    
        cell.leadingConstraint?.constant = 24
        cell.trailingConstraint?.constant = -24
        cell.app = self.todayApp?.apps?[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let app = self.todayApp?.apps?[indexPath.item]{
            self.handleClick?(app)
        }
    }
}
