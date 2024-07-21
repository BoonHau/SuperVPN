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
    private var viewModel = ProtocolViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initScreen()
        initTableView()
        initBinding()
        viewModel.fetchProtocols()
    }
}


extension ProtocolViewController {
    
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
    
    private func initBinding() {
        
        viewModel.$protocols
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}


extension ProtocolViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.protocols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.protocols[indexPath.row]
        
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
