//
//  UserDefaultsHelper.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 21/07/2024.
//

import Foundation

class UserDefaultsHelper {
 
    static let shared = UserDefaultsHelper()
    
    // MARK: - Keys
    private enum Keys {
        static let language = "AppLanguage"
    }
    
    private init() {}
    
    // MARK: - Language
    var language: String? {
        get {
            return UserDefaults.standard.string(forKey: Keys.language)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.language)
        }
    }
}


extension UserDefaultsHelper {
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: Keys.language)
    }
    
}
