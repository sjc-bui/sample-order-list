//
//  UIViewController+Extension.swift
//  sample-order-list
//
//  Created by quan bui on 2021/06/23.
//

import UIKit

// MARK: - Find top controller
public extension UIViewController {
    
    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    var bottomBarHeight: CGFloat {
        return tabBarController?.tabBar.frame.height ?? 0.0
    }
    
    class func topViewController() -> UIViewController? {
        return UIViewController.topViewControllerForRoot(rootViewController: UIApplication.shared.keyWindow?.rootViewController)
    }
    
    class func popToViewController(_ viewController: UIViewController, animated: Bool = true) {
        topViewController()?.navigationController?.popToViewController(viewController, animated: animated)
    }
    
    class func topViewControllerForRoot(rootViewController: UIViewController?) -> UIViewController? {
        guard let rootViewController = rootViewController else {
            return nil
        }
        
        if rootViewController is UINavigationController {
            let navigationController: UINavigationController = rootViewController as! UINavigationController
            return UIViewController.topViewControllerForRoot(rootViewController: navigationController.viewControllers.last)
            
        } else if rootViewController is UITabBarController {
            let tabBarController: UITabBarController = rootViewController as! UITabBarController
            return UIViewController.topViewControllerForRoot(rootViewController: tabBarController.selectedViewController)
            
        } else if rootViewController.presentedViewController != nil {
            return UIViewController.topViewControllerForRoot(rootViewController: rootViewController.presentedViewController)
        } else {
            return rootViewController
        }
    }
    
    static var topNavigationVC: UINavigationController? {
        return topViewController()?.navigationController
    }
    
    var previousViewController:UIViewController?{
        if let controllersOnNavStack = self.navigationController?.viewControllers{
            let n = controllersOnNavStack.count
            // if self is still on Navigation stack
            if controllersOnNavStack.last === self, n > 1{
                return controllersOnNavStack[n - 2]
            } else if n > 0 {
                return controllersOnNavStack[n - 1]
            }
        }
        return nil
    }
    
//    class func setRootVCBySinInVC() {
//        guard let window = UIApplication.shared.keyWindow else { return }
//        window.rootViewController = UINavigationController(rootViewController: SignInViewController())
//    }
    
    var topbarHeightY: CGFloat {
        if #available(iOS 13.0, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
            return topBarHeight
        }
    }

}

// MARK: - Support Method
extension UIViewController {
    
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
    
}
