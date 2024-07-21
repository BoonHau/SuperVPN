//
//  PremiumViewController.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class PremiumViewController: BaseViewController {
    
    // UI
    @IBOutlet weak var vwHeader: CustomHeader!
    private var vwExclusiveBenefits: ExclusiveBenefitsView!
    private var vwExclusivePurchase: ExclusivePurchaseView!
    private var vwExclusiveFooterView: ExclusiveFooterView!
    @IBOutlet weak var vwStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initScreen()
    }

    
    override func initScreen() {
        super.initScreen()
        
        vwHeader.setupView(title: "", delegate: self)
        vwHeader.setRightButton(icon: UIImage(imageLiteralResourceName: "ic_close_black"), buttonStyle: .rightIcon1)
        vwHeader.btnBack.isHidden = true
        
        vwExclusiveBenefits = ExclusiveBenefitsView()
        vwExclusivePurchase = ExclusivePurchaseView()
        vwExclusiveFooterView = ExclusiveFooterView()
        
        vwStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        vwStackView.addArrangedSubview(vwExclusiveBenefits)
        vwStackView.addArrangedSubview(vwExclusivePurchase)
        vwStackView.addArrangedSubview(vwExclusiveFooterView)
    }

}


extension PremiumViewController: CustomHeaderProtocol {
    
    func customHeaderDidPressOnBack() {
        
    }
    
    func customHeaderDidPressOnRightIcon(buttonStyle: CustomHeader.CustomHeaderButtonStyle) {
        self.navigationController?.dismiss(animated: true)
    }
}
