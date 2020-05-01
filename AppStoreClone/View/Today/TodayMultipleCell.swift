//
//  TodayMultipleCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 01/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayMultipleCell: UICollectionViewCell, UITableViewDelegate,UITableViewDataSource {
    let tableID = "tableid"
    var tableView:UITableView!
    
    var todayApp:TodayApp?{
        didSet{
            if let app = todayApp{
                categoryLabel.text = app.categoria
                descriptionlabel.text = app.descricao
            }
        }
    }
    
    let categoryLabel:UILabel = .setupLabel(title: "VIAGEM", fontSize: 18)
    let descriptionlabel:UILabel = .setupBoldLabel(title: "Explore o mundo \nsem medo", fontSize: 28, numberOfLines: 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        tableView = UITableView()
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodayMultipleTableCell.self, forCellReuseIdentifier: tableID)
       
        let stackView = UIStackView(arrangedSubviews: [categoryLabel,descriptionlabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        
        
        addSubview(stackView)
        
        stackView.setAutoLayoutProperties(top: topAnchor, trailing: trailingAnchor, bottom: nil, leading: leadingAnchor, padding: .init(top: 24, left: 24, bottom: 0, right: 24))
        
        
        addSubview(tableView)
        
        tableView.setAutoLayoutProperties(top: stackView.bottomAnchor, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor, padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodayMultipleCell{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todayApp?.apps?.count ?? 0 
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableID, for: indexPath) as! TodayMultipleTableCell
        cell.app = self.todayApp?.apps?[indexPath.item]
        return cell
      }
      
}
