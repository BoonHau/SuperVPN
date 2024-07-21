//
//  BaseTableViewCell.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import Foundation

class BaseTableViewCell: UITableViewCell {
    
    
    // A static fucntion to automatically register cell
    static func register(to tableView: UITableView) {
        tableView.register(UINib(nibName: String(describing: Self.self), bundle: nil), forCellReuseIdentifier: String(describing: Self.self))
    }
    
    
    // A static function to get registed cell
    static func dequeueCell<T: BaseTableViewCell>(from tableView: UITableView, indexPath: IndexPath) -> T? {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: Self.self), for: indexPath) as? T
    }
    
}
