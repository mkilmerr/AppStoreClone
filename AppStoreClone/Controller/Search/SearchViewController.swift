//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    let cellID = "searchCellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellID)
        
    }
    
}

//MARK:- TableView Methods

extension SearchViewController{
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
    
    //       override func numberOfSections(in tableView: UITableView) -> Int {
    //           return 1
    //       }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SearchCell
        return cell
    }
    
    
}
