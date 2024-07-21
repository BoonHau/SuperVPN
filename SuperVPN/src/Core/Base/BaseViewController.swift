//
//  BaseViewController.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tap)
    }
    
}


extension BaseViewController {
    
    @objc func initScreen() {
        view.backgroundColor = Constants.Color.BACKGROUND
    }
    
    @objc func initListener() {
    }
    
    // Generic method to navigate to another view controller in a different storyboard
    func navigateToViewController<T: UIViewController>(storyboardName: String, viewControllerID: String?, type: T.Type, animated: Bool = true) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController: UIViewController
        
        if let safeViewControllerID = viewControllerID {
            
            // Instantiate using storyboard ID
            guard let instantiatedVC = storyboard.instantiateViewController(withIdentifier: safeViewControllerID) as? T else {
                print("Error: Could not instantiate view controller with ID \(safeViewControllerID) in storyboard \(storyboardName).")
                return
            }
            viewController = instantiatedVC
        } else {
            var test = storyboard.instantiateInitialViewController()
            // Instantiate using the initial view controller
            guard let initialVC = storyboard.instantiateInitialViewController() as? T else {
                print("Error: Could not instantiate initial view controller in storyboard \(storyboardName).")
                return
            }
            viewController = initialVC
        }
        
        if (viewController is UINavigationController) {
            self.present(viewController, animated: animated, completion: nil)
        }
        else {
            if let navigationController = self.navigationController {
                navigationController.pushViewController(viewController, animated: animated)
            } else {
                self.present(viewController, animated: animated, completion: nil)
            }
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
