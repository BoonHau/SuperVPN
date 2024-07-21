//
//  BaseView.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation


@IBDesignable
class BaseView: UIView {

    // Variable for nib name in storybaord
    @IBInspectable var nibName: String?
    
    // Content View
    var contentView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Setup Xib file
        setupXib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup Xib file
        setupXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // Setup Xib file
        setupXib()
    }
}


extension BaseView {
    
    func setupXib() {
        
        guard let view = loadViewFromNib() else {
            return
        }
        
        // Setup size and view
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    
    private func loadViewFromNib() -> UIView? {
        
        // Check nib name has value else return nil
        guard let nibName = nibName else {
            return nil
        }
        
        // Initialize nib with nib name
        let nib = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
        
        // return nib view after initialized
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
