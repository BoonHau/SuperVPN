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

        sideMenuItems = DummyData.getSideMenuItems()
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
        
        switch sideMenuItem.type {
        case .header:
            if let cell = SideMenuHeaderTableViewCell.dequeueCell(from: tableView, indexPath: indexPath) as? SideMenuHeaderTableViewCell {
                return cell
            }
            break
        case .default1:
            if let cell = SideMenuDefault1TableViewCell.dequeueCell(from: tableView, indexPath: indexPath) as? SideMenuDefault1TableViewCell {
                cell.setupCell(icon: sideMenuItem.icon, title: sideMenuItem.title)
                return cell
            }
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMenuItem(at: indexPath)
        
        // De-highlight the cell immediately after selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
