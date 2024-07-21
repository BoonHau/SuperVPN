//
//  NeumorphicButton.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation


class NeumorphicView: UIView {
    
    // Variables
    private var lightShadow: CALayer!
    private var darkShadow: CALayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNeumorphicStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNeumorphicStyle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lightShadow.frame = bounds
        darkShadow.frame = bounds
        lightShadow.cornerRadius = layer.cornerRadius
        darkShadow.cornerRadius = layer.cornerRadius
    }
}



extension NeumorphicView {
    
    private func setupNeumorphicStyle() {
        
        lightShadow = CALayer()
        darkShadow = CALayer()
        
        // Configure light shadow
        lightShadow.frame = bounds
        lightShadow.backgroundColor = backgroundColor?.cgColor
        lightShadow.cornerRadius = layer.cornerRadius
        lightShadow.shadowColor = UIColor.white.cgColor
        lightShadow.shadowOffset = CGSize(width: -5, height: -5)
        lightShadow.shadowOpacity = 0.3
        lightShadow.shadowRadius = 5
        layer.insertSublayer(lightShadow, at: 0)
        
        // Configure dark shadow
        darkShadow.frame = bounds
        darkShadow.backgroundColor = backgroundColor?.cgColor
        darkShadow.cornerRadius = layer.cornerRadius
        darkShadow.shadowColor = UIColor.black.cgColor
        darkShadow.shadowOffset = CGSize(width: 5, height: 5)
        darkShadow.shadowOpacity = 0.15
        darkShadow.shadowRadius = 5
        layer.insertSublayer(darkShadow, at: 0)
        
        // Button styling
        layer.cornerRadius = 20
        backgroundColor = Constants.Color.BACKGROUND
        layer.masksToBounds = false
    }
}
