//
//  UIView+Extension.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation


extension UIView {
    
    var width: CGFloat {
        return bounds.width
    }
    
    var height: CGFloat {
        return bounds.height
    }
    
    var originX: CGFloat {
        return frame.origin.x
    }
    
    var originY: CGFloat {
        return frame.origin.y
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    func roundToCircle() {
        self.layer.cornerRadius = min(self.bounds.width, self.bounds.height) / 2
        self.layer.masksToBounds = true
    }
    
    func addBottomCornerRadiusWithShadow(cornerRadius: CGFloat, shadowColor: UIColor = .black, shadowOpacity: Float = 0.5, shadowOffset: CGSize = CGSize(width: 0, height: 2), shadowRadius: CGFloat = 4) {
            
        // Create the path for the bottom corners rounded
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        
        // Create a mask layer using the path
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
        
        // Create a shadow layer
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = path.cgPath
        shadowLayer.fillColor = backgroundColor?.cgColor
        
        // Apply shadow properties
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowRadius = shadowRadius
        
        // Insert shadow layer below the view
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func addBottomCornerRadiusAndShadow(cornerRadius: CGFloat, shadowColor: UIColor = .black, shadowOpacity: Float = 0.5, shadowOffset: CGSize = CGSize(width: 0, height: 2), shadowRadius: CGFloat = 4) {
            // Round bottom corners
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            // Add shadow
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowRadius = shadowRadius
            
            // Update shadow path
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
            
            // Ensure the view's bounds are correct
            self.layer.masksToBounds = false
        }
}
