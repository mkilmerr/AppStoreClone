//
//  BaseTabBarViewController.swift
//  AppStoreClone
//
//  Created by Marcos Kilmer on 15/04/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //MARK:- Tab Bar Items
        let todayViewController = creteTabBarAndNavItems(viewController: UIViewController(), title: "Hoje", imageName: "icone-hoje")
        
        let appsViewController = creteTabBarAndNavItems(viewController: UIViewController(), title: "Apps", imageName: "icone-apps")
        
        let searchViewController = creteTabBarAndNavItems(viewController: SearchViewController(), title: "Busca", imageName: "icone-busca")
        
        viewControllers = [
            todayViewController,
            appsViewController,
            searchViewController
        ]
        selectedIndex = 2
        
      
    }
    
    
    //MARK:- Create Tab Bar Items and Nav Items
    func creteTabBarAndNavItems(viewController: UIViewController, title:String, imageName:String) -> UIViewController{
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.view.backgroundColor = .white
       
        return navigationController
        
    }


}
