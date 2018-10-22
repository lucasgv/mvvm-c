//
//  BaseNavigationViewController.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 19/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.topViewController?.preferredStatusBarStyle ?? .lightContent
    }
    
    static func initFromStoryboard(named storyboardName: String) -> Self? {
        return initFromStoryboardHelper(storyboardName: storyboardName) ?? nil
    }
    
    private class func initFromStoryboardHelper<T>(storyboardName: String) -> T? {
        
        let storyoard = UIStoryboard(name: storyboardName, bundle: nil)
        let className = String(describing: self)
        let viewController = storyoard.instantiateViewController(withIdentifier: className) as? T
        return viewController
    }
}
