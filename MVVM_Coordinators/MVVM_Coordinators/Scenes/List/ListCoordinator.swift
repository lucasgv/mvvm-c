//
//  ListCoordinator.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 19/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import UIKit

class ListCoordinator: Coordinator {
    
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
        guard let controller = ViewController.initFromStoryboard(named: "Main") else { return }
        self.navigationController.setViewControllers([controller], animated: true)
    }
}

// MARK: - Base View Controller delegate

extension ListCoordinator: BaseViewControllerDelegate {
    
    func viewControllerDidExit(_ viewController: UIViewController) {
        self.coordinatorDelegate?.coordinatorDidExit(self)
    }
}
