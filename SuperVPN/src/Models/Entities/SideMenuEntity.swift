//
//  SideMenuEntity.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation

class SideMenuEntity {
    
    var title : String
    var icon  : UIImage
    var itemType  : SideMenuConstants.SideMenuItemType
    
    init(title: String, icon: UIImage, itemType: SideMenuConstants.SideMenuItemType) {
        self.title = title
        self.icon  = icon
        self.itemType  = itemType
    }
    
}
