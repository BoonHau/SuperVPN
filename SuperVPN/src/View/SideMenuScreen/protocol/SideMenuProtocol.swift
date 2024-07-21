//
//  SideMenuProtocol.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 21/07/2024.
//

import Foundation


protocol SideMenuProtocol: NSObjectProtocol {
    
    func didSelectMenuItem(at indexPath: IndexPath)
    
}
