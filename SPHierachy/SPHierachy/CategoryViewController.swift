//
//  CategoryViewController.swift
//  SPHierachy
//
//  Created by Sebastien on 17/03/2019.
//  Copyright © 2019 Sebastien. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: "CategoryViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK - Actions
    
    @IBAction func didTapKid() {
        
        coordinator?.launchKidHome()
        
        /*
        let nvc = UINavigationController(rootViewController: KidViewController())
        self.presentingViewController?.dismiss(animated: true, completion: {
            UIApplication.shared.keyWindow?.rootViewController?.present(nvc, animated: true, completion: nil)
        })
        */
 }
    
    @IBAction func didTapAdult() {
        
        coordinator?.launchAdultHome()
        
        /*
        let tabBar = SPTabBarController()
        self.presentingViewController?.dismiss(animated: true, completion: {
            UIApplication.shared.keyWindow?.rootViewController?.present(tabBar, animated: true, completion: nil)
        })
        */
    }

}
