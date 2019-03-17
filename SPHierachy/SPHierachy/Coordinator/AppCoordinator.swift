//
//  AppCoordinator.swift
//  SPHierachy
//
//  Created by Sebastien on 17/03/2019.
//  Copyright © 2019 Sebastien. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: NSObject {
    
    private(set) var rootViewController: UIViewController?
    
    func startApp() {
        rootViewController = SplashViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.rootViewController?.present(CategoryViewController(coordinator: self), animated: false, completion: nil)
        }
    }
    
    func launchKidHome() {
        changeRootViewController(to: KidViewController(coordinator: self))
    }
    
    func launchAdultHome() {
        changeRootViewController(to: SPTabBarController(coordinator: self))
    }
    
    func backToChoice() {
        changeRootViewController(to: CategoryViewController(coordinator: self))
    }
    
    private func presentCategoryViewController() {
        self.rootViewController?.present(CategoryViewController(coordinator: self), animated: false, completion: nil)
    }
    
    private func changeRootViewController(to viewController: UIViewController) {
        rootViewController?.presentedViewController?.dismiss(animated: false, completion: {
            self.rootViewController?.present(viewController, animated: false, completion: nil)
        })
    }
    
}
