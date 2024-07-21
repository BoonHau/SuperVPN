//
//  ExclusiveFooterView.swift.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 20/07/2024.
//

import UIKit

class ExclusiveFooterView: BaseView {

    // UI
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnRestorePurchases: UIButton!
    
    
    override func awakeFromNib() {
        nibName = "ExclusiveFooterView"
        super.awakeFromNib()
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibName = "ExclusiveFooterView"
        setupXib()
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibName = "ExclusiveFooterView"
        setupXib()
        initView()
    }

}

extension ExclusiveFooterView {
    
    private func initView() {
        btnSignIn.setTitle("SIGN_IN".toLocalized(), for: .normal)
        btnRestorePurchases.setTitle("RESTORE_PURCHASES".toLocalized(), for: .normal)
    }
    
}
