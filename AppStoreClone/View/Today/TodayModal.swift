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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        self.uiview = UIView()
    }
    
    func animation(){
        guard let uiview = self.uiview else{return}
        guard let frame = self.frame else{return}
        
        uiview.backgroundColor = .blue
        uiview.frame = frame
        
        view.addSubview(uiview)
       
    }
}
