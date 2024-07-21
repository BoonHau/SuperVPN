//
//  String+Extensions.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 20/07/2024.
//

import Foundation


extension String {
    
    func toLocalized(comment: String = "") -> String {
        return Localization.shared.localizedString(forKey: self, comment: comment)
    }
    
}
