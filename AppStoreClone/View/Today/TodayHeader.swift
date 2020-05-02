//
//  TodayHeader.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 02/05/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit


class TodayHeader:UICollectionReusableView{
    let dayLabel:UILabel = .setupLabel(title: "Day", fontSize: 14)
    let todayLabel:UILabel = .setupBoldLabel(title: "Hoje", fontSize: 34)
    let userImage:UIImageView = .setupTodayUserImage()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGroupedBackground
        
        addSubview(dayLabel)
        self.day()
        dayLabel.setAutoLayoutProperties(top: topAnchor, trailing:nil, bottom: nil, leading: leadingAnchor, padding: .init(top: 24, left: 24, bottom: 0, right: 0))
        
        addSubview(todayLabel)
        todayLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        
        todayLabel.setAutoLayoutProperties(top: dayLabel.bottomAnchor, trailing: nil, bottom: bottomAnchor, leading: leadingAnchor, padding: .init(top: -2, left: 24, bottom: 10, right: 0))
        addSubview(userImage)
        userImage.setAutoLayoutProperties(top: nil, trailing: trailingAnchor, bottom: bottomAnchor, leading: nil, padding: .init(top: 0, left:0, bottom: 10, right: 24))
        
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


extension TodayHeader{
    
    
    func day() {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let year =  components.year
        let month = components.month
        let day = components.day
        
        guard let currentYear = year else{return}
        guard let currentMonth = month else{return}
        guard let currentDay = day else{return}
        
        self.dayLabel.text = "\(currentDay)/\(currentMonth)/\(currentYear)"
        
    }
}
