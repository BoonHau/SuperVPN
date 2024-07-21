//
//  ProtocolDefault1TableViewCell.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class ProtocolDefault1TableViewCell: BaseTableViewCell {

    // UI
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    @IBOutlet weak var vwDefault: UIStackView!
    @IBOutlet weak var lblDefaultTitle: UILabel!
    @IBOutlet weak var lblDefaultChange: UILabel!
    
    
    
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


extension ProtocolDefault1TableViewCell {
    
    private func initCell() {
        lblDefaultTitle.attributedText = NSAttributedString(string: "DEFAULT".toLocalized(), attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: Constants.Color.SUBTITLE,
            .font: UIFont.systemFont(ofSize: CGFloat(15))
        ])
        lblDefaultChange.text = "CHANGE".toLocalized()
        
        
    }
    
    func setupCell(title: String, subtitle: String, isDefault: Bool, tag: String?, tagColor: UIColor?) {
        lblTitle.text = title
        lblSubtitle.text = subtitle
        vwDefault.isHidden = !isDefault
        lblTag.text = tag
        lblTag.textColor = tagColor
    }
}
