//
//  ProtocolDefault2TableViewCell.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class ProtocolDefault2TableViewCell: BaseTableViewCell {

    // UI
    @IBOutlet weak var vwBackground: UIGradientView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    
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

extension ProtocolDefault2TableViewCell {
    
    private func initCell() {
        vwBackground.applyGradient(colors: [Constants.Color.PRIMARY1, Constants.Color.PRIMARY2])
    }
    
    func setupCell(title: String, subtitle: String) {
        lblTitle.text = title
        lblSubtitle.text = subtitle
    }
}
