//
//  AppCoordinator.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 15/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var coordinatorDelegate: CoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Start
    
    func start() {
        showList()
    }
    
    func showList() {
        let listCoordinator = ListCoordinator(navigationController: self.navigationController)
        listCoordinator.start()
        
        self.childCoordinators.append(listCoordinator)
    }
}

// MARK: - Base View Controller delegate

extension AppCoordinator: BaseViewControllerDelegate {
    
    func viewControllerDidExit(_ viewController: UIViewController) {
        self.coordinatorDelegate?.coordinatorDidExit(self)
    }
}
