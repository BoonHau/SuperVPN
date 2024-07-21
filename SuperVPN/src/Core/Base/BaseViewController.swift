//
//  BaseViewController.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Combine

class BaseViewController: UIViewController {

    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension BaseViewController {
    
    @objc func initScreen() {
        view.backgroundColor = Constants.Color.BACKGROUND
    }
    
    @objc func initListener() {
    }
    
    // Generic method to navigate to another view controller in a different storyboard
    func navigateToViewController<T: UIViewController>(storyboardName: Constants.Storyboard, viewControllerID: String?, type: T.Type, animated: Bool = true) {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let viewController: UIViewController
        
        if let safeViewControllerID = viewControllerID {
            
            // Instantiate using storyboard ID
            guard let instantiatedVC = storyboard.instantiateViewController(withIdentifier: safeViewControllerID) as? T else {
                print("Error: Could not instantiate view controller with ID \(safeViewControllerID) in storyboard \(storyboardName.rawValue).")
                return
            }
            viewController = instantiatedVC
        } else {
            
            // Instantiate using the initial view controller
            guard let initialVC = storyboard.instantiateInitialViewController() as? T else {
                print("Error: Could not instantiate initial view controller in storyboard \(storyboardName.rawValue).")
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
