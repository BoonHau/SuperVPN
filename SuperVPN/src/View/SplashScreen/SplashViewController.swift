//
//  SplashViewController.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class SplashViewController: BaseViewController {
    
    // UI
    @IBOutlet weak var lblTitle: UILabel!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait // Restrict to portrait only
    }

    override var shouldAutorotate: Bool {
        return false // Disable auto rotation
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize screen
        initScreen()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        performDelayedNavigation()
    }
}



extension SplashViewController {
    
    override func initScreen() {
        super.initScreen()
        lblTitle.text = "FREE_VPN_SUPER".toLocalized()
    }
    
    private func performDelayedNavigation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in 
            self?.navigateToViewController(storyboardName: .Home, viewControllerID: nil, type: UINavigationController.self)
        }
    }
}
