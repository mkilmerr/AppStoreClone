//
//  TodayViewController.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 25/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
       let indicator = UIActivityIndicatorView.init(style: .large)
             indicator.startAnimating()
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
