//
//  CustomHeader.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation


protocol CustomHeaderProtocol {
    
    func customHeaderDidPressOnBack()
    
    func customHeaderDidPressOnRightIcon(buttonStyle: CustomHeader.CustomHeaderButtonStyle)
    
}


class CustomHeader: BaseView {
    
    // Enum
    @objc enum CustomHeaderButtonStyle: Int {
        case rightIcon1 = 1
    }
    
    
    // UI / UX
    @IBOutlet weak var lblTitle      : UILabel!
    @IBOutlet weak var btnBack       : UIView!
    
    @IBOutlet weak var ivRightIcon1  : UIImageView!
    @IBOutlet weak var btnRightIcon1 : UIView!
    
    // Common variables
    private var delegate: CustomHeaderProtocol?

    
    /// The method notifies for service after the view has loaded
    /// Used to notify for service after the view has loaded
    override func awakeFromNib() {
        nibName = "CustomHeader"
        super.awakeFromNib()
        initView()
        initListener()
    }
    
    
    @objc func actDidPressOnButton(_ gestureRecognizer : UITapGestureRecognizer) {
        
        // Handle action by gesture recognizer view
        switch gestureRecognizer.view {
            
        // Handle back
        case btnBack:
            delegate?.customHeaderDidPressOnBack()
            break
        
        // Handle right icon
        case btnRightIcon1:
            delegate?.customHeaderDidPressOnRightIcon(buttonStyle: .rightIcon1)
            break
            
        // Handle unknown
        default: break
        }
    }
}


extension CustomHeader {
    
    func setupView(title: String, delegate: CustomHeaderProtocol) {
        
        // Set title
        lblTitle.text = title
        
        // Store common variables
        self.delegate = delegate
    }
    
    
    func setRightButton(icon: UIImage?, buttonStyle: CustomHeaderButtonStyle) {
        
        // Set right button1
        if (buttonStyle == .rightIcon1) {
            
            // Set right button1
            btnRightIcon1.isHidden = false
            ivRightIcon1.image = icon
            
            // Set right button1 listener
            btnRightIcon1.isUserInteractionEnabled = true
            btnRightIcon1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actDidPressOnButton(_:))))
        }
    }
    
    
    private func initView() {
        
        // Clear background color
        self.backgroundColor = .clear
    }
    
    
    private func initListener() {
        
        // Set back button listener
        btnBack.isUserInteractionEnabled = true
        btnBack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actDidPressOnButton(_:))))
    }
}
