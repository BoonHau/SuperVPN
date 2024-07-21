//
//  HomeViewController.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // UI
    @IBOutlet weak var btnBanner: UIView!
    @IBOutlet weak var vwBannerSales: UIGradientView!
    @IBOutlet weak var lblBannerTitle: UILabel!
    @IBOutlet weak var lblBannerFasterSpeed: UILabel!
    @IBOutlet weak var lblBannerWorldwideLocation: UILabel!
    @IBOutlet weak var lblBannerStreamingServers: UILabel!
    @IBOutlet weak var lblBannerNoAds: UILabel!
    @IBOutlet weak var lblBannerSalesPercent: UILabel!
    @IBOutlet weak var lblBannerYearlyPlanTitle: UILabel!
    
    @IBOutlet weak var vwContent: UIView!
    @IBOutlet weak var btnSideMenu: UIView!
    
    @IBOutlet weak var btnVPN: UIImageView!
    @IBOutlet weak var lblVPN: UILabel!
    
    @IBOutlet weak var btnGoPremium: UIGradientView!
    @IBOutlet weak var lblGoPremium: UILabel!
    
    @IBOutlet weak var btnPrivateBrowser: UIView!
    @IBOutlet weak var lblPrivateBrowser: UILabel!
    
    @IBOutlet weak var btnAdvancedFeatures: UIView!
    @IBOutlet weak var lblAdvancedFeatures: UILabel!
    
    @IBOutlet weak var btnSwitch: UIStackView!
    @IBOutlet weak var lblSwitch: UILabel!
    
    @IBOutlet weak var btnSelectLocation: UIStackView!
    @IBOutlet weak var lblSelectLocation: UILabel!
    
    
    private var vcSideMenu: SideMenuViewController!
    private var vwOverlay: UIView!
    
    // Variables
    private var isVPNOn = false
    private var isSideMenuOpen = false
    private let sideMenuWidth: CGFloat = 280.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initScreen()
        initListener()
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Ensure the shadow path is updated when the view's layout changes
        vwContent.addBottomCornerRadiusAndShadow(cornerRadius: 20, shadowOffset: CGSize(width: 0, height: 5))
        
        // Update overlay frame on layout changes
        vwOverlay.frame = view.bounds
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: { _ in
            // Update the side menu frame
            self.vcSideMenu.view.frame = CGRect(x: self.isSideMenuOpen ? 0 : -self.sideMenuWidth, y: 0, width: self.sideMenuWidth, height: size.height)
        }, completion: nil)
    }
}


extension HomeViewController {
    
    override func initScreen() {
        super.initScreen()
        
        lblGoPremium.text = "GO_PREMIUM!".toLocalized()
        lblVPN.text = "VPN_IS_OFF".toLocalized()
        lblVPN.textColor = Constants.Color.SUBTITLE
        lblSwitch.text = "AUTO".toLocalized()
        lblSelectLocation.text = "SELECT_LOCATION".toLocalized()
        lblPrivateBrowser.text = "PRIVATE_BROWSER".toLocalized()
        lblAdvancedFeatures.text = "ADVANCED_FEATURES".toLocalized()
        
        setupBackground()
        setupSalesBanner()
        setupOverlayView()
        setupSideMenu()
    }
    
    override func initListener() {
        super.initListener()
        
        btnVPN.isUserInteractionEnabled = true
        btnVPN.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actToggleVPM(_:))))
        btnSideMenu.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actToggleSideMenu)))
        btnBanner.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actTogglePremium(_:))))
        btnGoPremium.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actTogglePremium(_:))))
        btnSwitch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actToggleProtocol(_:))))
    }
    
    private func setupBackground() {
        vwContent.addBottomCornerRadiusAndShadow(cornerRadius: 20, shadowOffset: CGSize(width: 0, height: 5))
    }
    
    private func setupSalesBanner() {
        
        lblBannerTitle.text = "GO_PREMIUM_NOW".toLocalized()
        lblBannerFasterSpeed.text = "FASTER_SPEED".toLocalized()
        lblBannerWorldwideLocation.text = "WORLDWIDE_LOCATION".toLocalized()
        lblBannerStreamingServers.text = "STREAMING_SERVERS".toLocalized()
        lblBannerNoAds.text = "NO_ADS".toLocalized()
        lblBannerSalesPercent.text = "SAVE_36%".toLocalized()
        lblBannerYearlyPlanTitle.text =  "YEARLY_PLAN".toLocalized()
        
        vwBannerSales.applyGradient(colors: [Constants.Color.SECONDARY1, Constants.Color.SECONDARY2])
    }
    
    private func setupHeader() {
        navigateToViewController(storyboardName: "Protocol", viewControllerID: nil, type: UINavigationController.self)
    }
    
    private func setupSideMenu() {
        
        // Initialize the side menu view controller
        vcSideMenu = UIStoryboard(name: "SideMenu", bundle: nil).instantiateInitialViewController() as! SideMenuViewController
        vcSideMenu.setupSideMenu(delegate: self)
        vcSideMenu.view.frame = CGRect(x: -sideMenuWidth, y: 0, width: sideMenuWidth, height: view.bounds.height)
        addChild(vcSideMenu)
        view.addSubview(vcSideMenu.view)
        vcSideMenu.didMove(toParent: self)
        
        let radius: CGFloat = 40 // Set your desired corner radius
        let path = UIBezierPath(
            roundedRect: vcSideMenu.view.bounds,
            byRoundingCorners: [.topRight, .bottomRight],
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        vcSideMenu.view.layer.mask = maskLayer
    }
    
    private func setupOverlayView() {
        vwOverlay = UIView(frame: view.bounds)
        vwOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        vwOverlay.alpha = 0
        view.addSubview(vwOverlay)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actToggleSideMenu))
        vwOverlay.addGestureRecognizer(tapGesture)
    }
    
    @objc func actToggleSideMenu() {
        isSideMenuOpen.toggle()
                
        let targetPosition = isSideMenuOpen ? 0 : -sideMenuWidth
        UIView.animate(withDuration: 0.3, animations: {
            self.vcSideMenu.view.frame.origin.x = targetPosition
            self.vwOverlay.alpha = self.isSideMenuOpen ? 1 : 0
        })
    }
    
    @objc func actToggleVPM(_ sender: UITapGestureRecognizer) {
        isVPNOn.toggle()
        
        UIView.transition(with: btnVPN, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.btnVPN.image = self.isVPNOn ? UIImage(imageLiteralResourceName: "img_vpn_on") : UIImage(imageLiteralResourceName: "img_vpn_off")
            self.lblVPN.text = self.isVPNOn ? "VPN_IS_ON".toLocalized() : "VPN_IS_OFF".toLocalized()
            self.lblVPN.textColor = self.isVPNOn ? Constants.Color.PRIMARY1 : Constants.Color.SUBTITLE
        }, completion: nil)
    }
    
    @objc func actTogglePremium(_ sender: UITapGestureRecognizer) {
        navigateToViewController(storyboardName: "Premium", viewControllerID: nil, type: UINavigationController.self)
    }
    
    @objc func actToggleProtocol(_ sender: UITapGestureRecognizer) {
        navigateToViewController(storyboardName: "Protocol", viewControllerID: nil, type: ProtocolViewController.self)
    }
}


extension HomeViewController: SideMenuProtocol {
    
    func didSelectMenuItem(at indexPath: IndexPath) {
        actToggleSideMenu()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.navigateToViewController(storyboardName: "Language", viewControllerID: nil, type: LanguageViewController.self)
        }
    }
    
}
