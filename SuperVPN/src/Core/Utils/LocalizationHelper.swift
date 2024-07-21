//
//  LocalizationHelper.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 21/07/2024.
//

import Foundation


class Localization {
    static let shared = Localization()
    private var bundle: Bundle?
    
    func setLanguage(languageCode: String) {
        let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") ?? Bundle.main.path(forResource: "Base", ofType: "lproj")!
        bundle = Bundle(path: path)
    }
    
    func localizedString(forKey key: String, comment: String = "") -> String {
        return bundle?.localizedString(forKey: key, value: nil, table: nil) ?? NSLocalizedString(key, comment: comment)
    }
}
