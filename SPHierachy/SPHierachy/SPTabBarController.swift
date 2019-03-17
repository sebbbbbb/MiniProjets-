//
//  SPTabBarController.swift
//  SPHierachy
//
//  Created by Sebastien on 17/03/2019.
//  Copyright © 2019 Sebastien. All rights reserved.
//

import UIKit

class SPTabBarController: UITabBarController {

    weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: "SPTabBarController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = HomeViewController(coordinator: coordinator!)
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let downloadViewController = DownloadViewController()
        downloadViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        viewControllers = [homeViewController, downloadViewController]
    }
    


}
