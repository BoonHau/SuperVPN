//
//  DummyData.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import Foundation


class DummyData {
    
    static func getProtocols() -> [ProtocolEntity] {
        return [
            ProtocolEntity(title: "AUTO".toLocalized(), subtitle: "PROTOCOL_AUTO".toLocalized(), type: .default2),
            ProtocolEntity(title: "HIDDEN_TLS".toLocalized(), subtitle: "PROTOCOL_HIDDEN_TLS_MSG".toLocalized(), type: .default1, isDefault: true, tag: "(RECOMENDED)".toLocalized(), tagColor: Constants.Color.SUBTITLE),
            ProtocolEntity(title: "EVEREST".toLocalized(), subtitle: "PROTOCOL_EVEREST_MSG".toLocalized(), type: .default1, tag: "PREMIUM".toLocalized(), tagColor: Constants.Color.SECONDARY1),
            ProtocolEntity(title: "UDP".toLocalized(), subtitle: "PROTOCOL_UDP_MSG".toLocalized(), type: .default1),
            ProtocolEntity(title: "TCP".toLocalized(), subtitle: "PROTOCOL_TCP_MSG".toLocalized(), type: .default1),
            ProtocolEntity(title: "TLS".toLocalized(), subtitle: "PROTOCOL_COMMON_MSG".toLocalized(), type: .default1),
            ProtocolEntity(title: "HTTP".toLocalized(), subtitle: "PROTOCOL_COMMON_MSG".toLocalized(), type: .default1),
            ProtocolEntity(title: "FTP".toLocalized(),subtitle: "PROTOCOL_COMMON_MSG".toLocalized(), type: .default1),
            ProtocolEntity(title: "", subtitle: "PROTOCOL_WEB_DOMAIN_MSG".toLocalized(), type: .webDomain)
        ]
    }
    
    
    static func getSideMenuItems() -> [SideMenuEntity] {
        return [
            SideMenuEntity(title: "", icon: #imageLiteral(resourceName: "ic_support"), itemType: .header),
            SideMenuEntity(title: "SUPPORT".toLocalized(), icon: #imageLiteral(resourceName: "ic_support"), itemType: .support),
            SideMenuEntity(title: "PROXY_SERVER".toLocalized(), icon: #imageLiteral(resourceName: "ic_server"), itemType: .proxyServer),
            SideMenuEntity(title: "USE_ON_OTHER_DEVICES".toLocalized(), icon: #imageLiteral(resourceName: "ic_devices"), itemType: .otherDevices),
            SideMenuEntity(title: "LANGUAGE".toLocalized(), icon: #imageLiteral(resourceName: "ic_languages"), itemType: .language),
            SideMenuEntity(title: "ABOUT".toLocalized(), icon: #imageLiteral(resourceName: "ic_about"), itemType: .about),
            SideMenuEntity(title: "RATE_US".toLocalized(), icon: #imageLiteral(resourceName: "ic_rate"), itemType: .rateUs),
            SideMenuEntity(title: "SHARE_VPN".toLocalized(), icon: #imageLiteral(resourceName: "ic_share"), itemType: .shareVPN)
        ]
    }
    
    
    static func getExclusivePurchaseItems() -> [ExclusivePurchaseItemEntity] {
        return [
            ExclusivePurchaseItemEntity(title: "YEARLY".toLocalized(), subtitle: "PREMIUM_YEARLY_MSG".toLocalized(), icon: #imageLiteral(resourceName: "ic_jewel_orange"), isSelected: true, isBestValue: true),
            ExclusivePurchaseItemEntity(title: "MONTHLY".toLocalized(), subtitle: "PREMIUM_MONTHLY_MSG".toLocalized(), icon: #imageLiteral(resourceName: "ic_jewel_blue"), isSelected: false, isBestValue: false),
            ExclusivePurchaseItemEntity(title: "WEEKLY".toLocalized(), subtitle: "PREMIUM_WEEKLY_MSG".toLocalized(), icon: #imageLiteral(resourceName: "ic_jewel_green"), isSelected: false, isBestValue: false)
        ]
    }
    
    static func getSupportedLanguages() -> [LanguageEntity] {
        return [
            LanguageEntity(title: "AUTO".toLocalized(), languageType: .Auto),
            LanguageEntity(title: "English", languageType: .English),
            LanguageEntity(title: "中文", languageType: .Chinese)
        ]
    }
}
