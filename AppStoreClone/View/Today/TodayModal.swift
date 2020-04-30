//
//  TodayModal.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 30/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayModal: UIViewController {
    var uiview:UIView?
    var frame:CGRect?
    var topAnchor:NSLayoutConstraint?
    var leadingAnchor:NSLayoutConstraint?
    var heightAnchor:NSLayoutConstraint?
    var widthAnchor:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        self.uiview = UIView()
    }
    
    func animation(){
        guard let uiview = self.uiview else{return}
        guard let frame = self.frame else{return}
        
        uiview.backgroundColor = .blue
        uiview.layer.cornerRadius = 16
        uiview.clipsToBounds = true
       
        view.addSubview(uiview)
        insertAutoLayoutProperties(uiview, frame)
        uiViewAnimate()
    }
    
    
    func insertAutoLayoutProperties(_ uiview:UIView, _ frame:CGRect){
        uiview.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor = uiview.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingAnchor  = uiview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.heightAnchor = uiview.heightAnchor.constraint(equalToConstant: frame.height)
        self.widthAnchor = uiview.widthAnchor.constraint(equalToConstant: frame.width)
        
        self.topAnchor?.isActive = true
        self.leadingAnchor?.isActive = true
        self.heightAnchor?.isActive = true
        self.widthAnchor?.isActive = true
        
        view.layoutIfNeeded()
        
       
    }
    
    func uiViewAnimate(){
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .overrideInheritedCurve, animations: {
            self.topAnchor?.constant = 0
            self.leadingAnchor?.constant = 0
            self.heightAnchor?.constant = self.view.frame.height
            self.widthAnchor?.constant = self.view.frame.width
            
            self.uiview?.layer.cornerRadius = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    
}
