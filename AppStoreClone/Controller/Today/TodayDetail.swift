//
//  TodayDetail.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 30/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayDetail: UITableViewController {
    let cellITableID = "table"
    var todayApp:TodayApp?
    let descriptionLabel:UILabel = {
        let description = UILabel()
        
        let txtAttr = NSMutableAttributedString(string: "Lore ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
        txtAttr.append(NSAttributedString(string: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        description.attributedText = txtAttr
        description.font = UIFont.systemFont(ofSize: 14)
        description.numberOfLines = 0
        
        return description
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellITableID)
        tableView.separatorStyle = .none
        tableView.allowsSelection  = false
        tableView.delegate = self
        tableView.dataSource = self
        
        self.addHeader()
        self.addFooter()
        //
        
    }
    
    
    func addHeader(){
        let header = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))
        
        let todayCell = TodayCell()
        todayCell.todayApp = self.todayApp
        todayCell.layer.cornerRadius = 0
        
        
        
        header.addSubview(todayCell)
        todayCell.fillAllScreen()
        
        self.tableView.tableHeaderView = header
    }
    
    func addFooter(){
        
        let footer = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))
        footer.addSubview(descriptionLabel)
        descriptionLabel.fillAllScreen(padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        
        self.tableView.tableFooterView = footer
        
    }
}


extension TodayDetail{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellITableID, for: indexPath)
        
        return cell
        
    }
    
}
