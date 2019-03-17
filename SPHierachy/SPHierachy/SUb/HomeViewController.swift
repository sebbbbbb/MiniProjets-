//
//  HomeViewController.swift
//  SPHierachy
//
//  Created by Sebastien on 17/03/2019.
//  Copyright © 2019 Sebastien. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func onBack() {
        coordinator?.backToChoice()
    }

}
