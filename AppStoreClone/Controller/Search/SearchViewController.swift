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
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
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

//MARK:- TableView Methods

extension SearchViewController{
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SearchCell
        return cell
    }
    
}
//MARK:- SearchBar Methods

extension SearchViewController{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        SearchService.sharedSearchService.fetchApp(textInput: searchText)
    }
}