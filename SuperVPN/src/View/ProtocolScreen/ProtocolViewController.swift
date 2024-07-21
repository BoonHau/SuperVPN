//
//  ProtocolViewController.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class ProtocolViewController: BaseViewController {

    // UI
    @IBOutlet weak var vwHeader   : CustomHeader!
    @IBOutlet weak var lblMessage : UILabel!
    @IBOutlet weak var tableView  : UITableView!
    
    // Variables
    private var protocols = DummyData.getProtocols()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initScreen()
        initTableView()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func initScreen() {
        super.initScreen()
        
        lblMessage.text = "PROTOCOL_MSG".toLocalized()
        vwHeader.setupView(title: "PROTOCOL".toLocalized(), delegate: self)
    }
    
    
    private func initTableView() {
        ProtocolDefault1TableViewCell.register(to: tableView)
        ProtocolDefault2TableViewCell.register(to: tableView)
        ProtocolWebDomainTableViewCell.register(to: tableView)
    }
}


extension ProtocolViewController {
    
}


extension ProtocolViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return protocols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = protocols[indexPath.row]
        
        switch item.type {
        case .default1:
            if let cell = ProtocolDefault1TableViewCell.dequeueCell(from: tableView, indexPath: indexPath) as? ProtocolDefault1TableViewCell {
                cell.setupCell(title: item.title, subtitle: item.subtitle,  isDefault: item.isDefault, tag: item.tag, tagColor: item.tagColor)
                return cell
            }
            break
        case .default2:
            if let cell = ProtocolDefault2TableViewCell.dequeueCell(from: tableView, indexPath: indexPath) as? ProtocolDefault2TableViewCell {
                cell.setupCell(title: item.title, subtitle: item.subtitle)
                return cell
            }
        case .webDomain:
            if let cell = ProtocolWebDomainTableViewCell.dequeueCell(from: tableView, indexPath: indexPath) as? ProtocolWebDomainTableViewCell {
                cell.setupCell(message: item.subtitle)
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
        
        // De-highlight the cell immediately after selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension ProtocolViewController: CustomHeaderProtocol {
    
    func customHeaderDidPressOnBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func customHeaderDidPressOnRightIcon(buttonStyle: CustomHeader.CustomHeaderButtonStyle) {
    }
    
}
