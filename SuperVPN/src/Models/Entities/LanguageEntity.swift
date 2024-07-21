//
//  LanguageEntity.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 21/07/2024.
//

import Foundation


class LanguageEntity {
    
    var title: String
    var languageType: Constants.LanguageType
    
    init(title: String, languageType: Constants.LanguageType) {
        self.title = title
        self.languageType = languageType
    }
    
}
