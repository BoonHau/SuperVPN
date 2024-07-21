//
//  Constants.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation


class Constants {
 
    // MARK:- Color
    struct Color {
        static let PRIMARY1      = UIColor(named: "color_primary1")!
        static let PRIMARY2      = UIColor(named: "color_primary2")!
        static let SECONDARY1    = UIColor(named: "color_secondary1")!
        static let SECONDARY2    = UIColor(named: "color_secondary2")!
        static let TITLE         = UIColor(named: "color_title")!
        static let SUBTITLE      = UIColor(named: "color_subtitle")!
        static let BACKGROUND    = UIColor(named: "color_background")!
    }
    
    enum LanguageType: String {
        case Auto = ""
        case English = "en"
        case Chinese = "zh-Hans"
    }
    
}
