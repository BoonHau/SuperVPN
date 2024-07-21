//
//  SideMenuViewController.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class SideMenuViewController: BaseViewController {

    // UI
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private weak var delegate: SideMenuProtocol?
    private var sideMenuItems = DummyData.getSideMenuItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initScreen()
        initTableView()
    }
}

extension SideMenuViewController {
    
    private func initTableView() {
        SideMenuHeaderTableViewCell.register(to: tableView)
        SideMenuDefault1TableViewCell.register(to: tableView)
    }
    
    func setupSideMenu(delegate: SideMenuProtocol) {
        self.delegate = delegate
    }
}


extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sideMenuItem = sideMenuItems[indexPath.row]
        
        switch sideMenuItem.itemType {
        case .header:
            if let cell = SideMenuHeaderTableViewCell.dequeueCell(from: tableView, indexPath: indexPath) as? SideMenuHeaderTableViewCell {
                return cell
            }
            break
        default:
            if let cell = SideMenuDefault1TableViewCell.dequeueCell(from: tableView, indexPath: indexPath) as? SideMenuDefault1TableViewCell {
                cell.setupCell(icon: sideMenuItem.icon, title: sideMenuItem.title, itemType: sideMenuItem.itemType)
                return cell
            }
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sideMenuItem = sideMenuItems[indexPath.row]
        delegate?.didSelectMenuItem(at: indexPath, itemType: sideMenuItem.itemType)
        
        // De-highlight the cell immediately after selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
