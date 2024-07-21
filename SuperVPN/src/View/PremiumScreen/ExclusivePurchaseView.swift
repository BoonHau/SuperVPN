//
//  ExclusivePurchaseView.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 20/07/2024.
//

import UIKit

class ExclusivePurchaseView: BaseView {

    // UI
    @IBOutlet weak var svExclusivePurchaseItems: UIStackView!
    @IBOutlet weak var btnContinue: UIGradientView!
    @IBOutlet weak var lblContinue: UILabel!
    
    // Variables
    var arrExclusivePurchaseItemViews: [ExclusivePurchaseItemView]! = []
    
    
    /// The method notifies for service after the view has loaded
    /// Used to notify for service after the view has loaded
    override func awakeFromNib() {
        nibName = "ExclusivePurchaseView"
        super.awakeFromNib()
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibName = "ExclusivePurchaseView"
        setupXib()
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibName = "ExclusivePurchaseView"
        setupXib()
        initView()
    }

    private func initView() {
        lblContinue.text = "CONTINUE".toLocalized()
        btnContinue.applyGradient(colors: [Constants.Color.SECONDARY1, Constants.Color.SECONDARY2])
        
        DummyData.getExclusivePurchaseItems().forEach { exclusivePurchaseItem in
            let itemView = ExclusivePurchaseItemView()
            itemView.setupView(
                icon: exclusivePurchaseItem.icon,
                title: exclusivePurchaseItem.title,
                subtitle: exclusivePurchaseItem.subtitle,
                isBestValue: exclusivePurchaseItem.isBestValue
            )
            itemView.setSelected(isSelected: exclusivePurchaseItem.isSelected)
            svExclusivePurchaseItems.addArrangedSubview(itemView)
            arrExclusivePurchaseItemViews.append(itemView)
            itemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actDidSelectExclusivePurchaseItemView(_:))))
        }
    }
}


extension ExclusivePurchaseView {
    
    @objc func actDidSelectExclusivePurchaseItemView(_ sender: UITapGestureRecognizer) {
        arrExclusivePurchaseItemViews.forEach { exclusivePurchaseItemView in
            if (exclusivePurchaseItemView == sender.view) {
                exclusivePurchaseItemView.setSelected(isSelected: true)
            }
            else {
                exclusivePurchaseItemView.setSelected(isSelected: false)
            }
        }
    }
}
