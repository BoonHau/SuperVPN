//
//  ExclusivePurchaseItemEntity.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 20/07/2024.
//

import UIKit
import Foundation


class ExclusivePurchaseItemEntity {
    
    var title      : String
    var subtitle   : String
    var icon       : UIImage
    var isSelected : Bool
    var isBestValue : Bool
    
    init(title: String, subtitle: String, icon: UIImage, isSelected: Bool, isBestValue: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.icon  = icon
        self.isSelected = isSelected
        self.isBestValue  = isBestValue
    }
    
}
