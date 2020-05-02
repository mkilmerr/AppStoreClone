//
//  TodayTableCell.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 30/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayTableCell: UITableViewCell {
    
    let descriptionLabel:UILabel = {
        let description = UILabel()
        
        let txtAttr = NSMutableAttributedString(string: "Lore ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
        txtAttr.append(NSAttributedString(string: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        txtAttr.append(NSAttributedString(string: "Lore ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))
     
        
        description.attributedText = txtAttr
        description.font = UIFont.systemFont(ofSize: 14)
        description.numberOfLines = 0
        
        return description
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
//
        descriptionLabel.fillAllScreen(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
        self.addSubview(descriptionLabel)
    }
    
    func buildCell(view:UIView){
        view.addSubview(descriptionLabel)
        descriptionLabel.fillAllScreen(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


