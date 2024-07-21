//
//  SideMenuDefault1TableViewCell.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 19/07/2024.
//

import UIKit

class SideMenuDefault1TableViewCell: BaseTableViewCell {
    
    // UI
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension SideMenuDefault1TableViewCell {
    
    func setupCell(icon: UIImage, title: String) {
        ivIcon.image = icon
        lblTitle.text = title
    }
    
}
