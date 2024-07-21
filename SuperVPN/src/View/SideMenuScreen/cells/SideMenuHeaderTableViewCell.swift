//
//  SideMenuHeaderTableViewCell.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class SideMenuHeaderTableViewCell: BaseTableViewCell {
    
    // UI
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var vwChevron: NeumorphicView!
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
    
    private func initCell() {
        ivAvatar.roundToCircle()
        lblTitle.text = "SIGN_IN_/_SIGN_UP".toLocalized()
        lblSubtitle.text = "FREE_ACCOUNT".toLocalized()
    }
}


