//
//  SideMenuEntity.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation

class SideMenuEntity {
    
    var title     : String
    var icon      : UIImage
    var type      : SideMenuConstants.CellType
    
    init(title: String, icon: UIImage, type: SideMenuConstants.CellType) {
        self.title = title
        self.icon  = icon
        self.type  = type
    }
    
}
