//
//  BaseViewController.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 19/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import UIKit

protocol BaseViewControllerDelegate: class {
    func viewControllerDidExit(_ viewController: UIViewController)
}

class BaseViewController: UIViewController {
    
    weak var baseDelegate: BaseViewControllerDelegate?
    
    static func initFromStoryboard(named storyboardName: String) -> Self? {
        return initFromStoryboardHelper(storyboardName: storyboardName)
    }
    
    private class func initFromStoryboardHelper<T>(storyboardName: String) -> T? {
        
        let storyoard = UIStoryboard(name: storyboardName, bundle: nil)
        let className = String(describing: self)
        let viewController = storyoard.instantiateViewController(withIdentifier: className) as? T
        return viewController
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.navigationController == nil {
            self.baseDelegate?.viewControllerDidExit(self)
        }
    }
}
