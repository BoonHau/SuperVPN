//
//  ProtocolWebDomainTableViewCell.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit
import FontAwesome_swift

class ProtocolWebDomainTableViewCell: BaseTableViewCell {
    
    // UI
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtWebDomain: UITextField!
    @IBOutlet weak var btnApply: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        initCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension ProtocolWebDomainTableViewCell {
    
    private func initCell() {
        btnApply.setTitle("APPLY".toLocalized(), for: .normal)
        txtWebDomain.placeholder = "PROTOCOL_WEB_DOMAIN_INPUT_MSG".toLocalized()
    }
    
    func setupCell(message: String) {
        
        let textAttributedString = NSMutableAttributedString(string: message, attributes: [
            .font: UIFont.systemFont(ofSize: CGFloat(15)),
            .foregroundColor: Constants.Color.SUBTITLE
        ])
        let iconAttributedString = NSAttributedString(string: String.fontAwesomeIcon(name: .questionCircle), attributes: [
            .font: UIFont.fontAwesome(ofSize: 15, style: .solid),
            .foregroundColor: Constants.Color.PRIMARY2
        ])
        
        textAttributedString.append(iconAttributedString)
        lblMessage.attributedText = textAttributedString
    }
    
}
