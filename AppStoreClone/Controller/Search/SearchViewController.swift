//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController,UISearchBarDelegate {
    let cellID = "searchCellID"
    var apps:[AppModel] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.allowsSelection = false
//        tableView.separatorStyle = .singleLine
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellID)
        
        self.setupSearchField()
        
    }
    
    func setupSearchField(){
        navigationItem.searchController = self.searchController
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "App Store"
        self.searchController.searchBar.delegate = self
        
    }
    
    
    
}

//MARK:- SearchBar Methods

extension SearchViewController{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        SearchService.sharedSearchService.fetchApp(textInput: searchText) { (apps,err) in
            if err != nil {
                print(err!)
                return
            }
            if let apps = apps {
                DispatchQueue.main.async {
                    self.apps = apps
                    self.tableView.reloadData()
                }
            }
    
        }
    }
    
   
}


//MARK:- TableView Methods

extension SearchViewController{
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SearchCell
        cell.apps = self.apps[indexPath.item]
        return cell
    }
    
}
