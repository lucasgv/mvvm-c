//
//  Coordinator.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 15/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import UIKit

protocol CoordinatorDelegate: class {
    func coordinatorDidExit(_ coordinator: Coordinator)
}

protocol Coordinator: CoordinatorDelegate {
    var coordinatorDelegate: CoordinatorDelegate? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    
    func coordinatorDidExit(_ coordinator: Coordinator) {
        guard let index = self.childCoordinators.index(where: { $0 === coordinator }) else { return }
        self.childCoordinators.remove(at: index)
    }
}
