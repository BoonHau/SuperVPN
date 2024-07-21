//
//  ExclusivePurchaseItemView.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 20/07/2024.
//

import UIKit
import Foundation


class ExclusivePurchaseItemView: BaseView {
    
    // UI
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var vwBestValue: UIView!
    @IBOutlet weak var lblBestValue: UILabel!
    
    
    override func awakeFromNib() {
        nibName = "ExclusivePurchaseItemView"
        super.awakeFromNib()
        initItemView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibName = "ExclusivePurchaseItemView"
        setupXib()
        initItemView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibName = "ExclusivePurchaseItemView"
        setupXib()
        initItemView()
    }
}


extension ExclusivePurchaseItemView {
    
    func initItemView() {
        lblBestValue.text = "BEST_VALUE".toLocalized()
    }
    
    func setupView(icon: UIImage, title: String, subtitle: String, isBestValue: Bool) {
        ivIcon.image = icon
        lblTitle.text = title
        lblSubtitle.text = subtitle
        vwBestValue.isHidden = !isBestValue
    }
    
    func setSelected(isSelected: Bool) {
        
        if (isSelected) {
            self.cornerRadius = CGFloat(20)
            self.borderColor = Constants.Color.PRIMARY2
            self.borderWidth = CGFloat(3)
        }
        else {
            self.cornerRadius = CGFloat(0)
            self.borderColor = .clear
            self.borderWidth = CGFloat(0)
        }
    }
    
}
