//
//  BaseTableViewHeaderFooterView.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView {

    // A static fucntion to automatically register cell
    static func register(to tableView: UITableView) {
        tableView.register(UINib(nibName: String(describing: Self.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: Self.self))
    }

    
    // A static function to get registed cell
    static func dequeueReusableHeaderFooterView(from tableView: UITableView) -> BaseTableViewHeaderFooterView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: Self.self)) as? BaseTableViewHeaderFooterView
    }
    
}
