//
//  ExclusiveBenefitsView.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 20/07/2024.
//

import UIKit

class ExclusiveBenefitsView: BaseView {
    
    // UI
    @IBOutlet weak var vwBackground: UIGradientView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFreeTitle: UILabel!
    @IBOutlet weak var lblPremiumTitle: UILabel!
    @IBOutlet weak var lblProtocolTitle: UILabel!
    
    @IBOutlet weak var lblSpeedTitle: UILabel!
    @IBOutlet weak var lblPremiumSpeedValue: UILabel!
    @IBOutlet weak var lblFreeSpeedValue: UILabel!
    
    @IBOutlet weak var lblLocationsTitle: UILabel!
    @IBOutlet weak var lblServersTitle: UILabel!
    @IBOutlet weak var lblNoAdsTitle: UILabel!
    @IBOutlet weak var lblOneToOneSupportTitle: UILabel!
    
    
    
    /// The method notifies for service after the view has loaded
    /// Used to notify for service after the view has loaded
    override func awakeFromNib() {
        nibName = "ExclusiveBenefitsView"
        super.awakeFromNib()
        
        // Initialize view
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibName = "ExclusiveBenefitsView"
        setupXib()
        
        // Initialize view
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibName = "ExclusiveBenefitsView"
        setupXib()
        
        // Initialize view
        initView()
    }
    
        
    private func initView() {
        vwBackground.applyGradient()
        lblTitle.text = "PREMIUM_EXCLUSIVE_BENEFITS_MSG".toLocalized()
        lblFreeTitle.text = "FREE".toLocalized()
        lblPremiumTitle.text = "PREMIUM".toLocalized()
        lblProtocolTitle.text = "PROTOCOL".toLocalized()
        lblSpeedTitle.text = "SPEED".toLocalized()
        lblFreeSpeedValue.text = "FAST".toLocalized()
        lblPremiumSpeedValue.text = "ULTRA_FAST".toLocalized()
        
        lblLocationsTitle.text = "LOCATIONS".toLocalized()
        lblServersTitle.text = "SERVERS".toLocalized()
        lblNoAdsTitle.text = "NO_ADS".toLocalized()
        lblOneToOneSupportTitle.text = "1_:_1_SUPPORT".toLocalized()
    }
}
