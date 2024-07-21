//
//  UIGradientView.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation


class UIGradientView: UIView {

    private var gradientLayer: CAGradientLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = self.bounds
    }

    func applyGradient(
        colors: [UIColor] = [Constants.Color.PRIMARY1, Constants.Color.PRIMARY2],
        startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),
        endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        // Optional: Remove existing gradient layers to avoid stacking multiple gradients
        self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.gradientLayer = gradientLayer
    }
}
