//
//  ProtocolSelectionEntity.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation


class ProtocolEntity {
    
    var title     : String
    var subtitle  : String
    var type      : ProtocolConstants.CellType
    var isDefault : Bool
    var tag       : String?
    var tagColor  : UIColor?
    
    init(title: String, subtitle: String, type: ProtocolConstants.CellType, isDefault: Bool = false, tag: String? = nil, tagColor: UIColor? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.type  = type
        self.isDefault = isDefault
        self.tag = tag
        self.tagColor = tagColor
    }
    
}
