//
//  DefaultTableViewCell.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 21/07/2024.
//

import UIKit

class DefaultTableViewCell: BaseTableViewCell {

    // UI
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivTick: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension DefaultTableViewCell {
    
    func setupCell(title: String, isSelected: Bool) {
        lblTitle.text = title
        ivTick.isHidden = isSelected ? false : true
    }
    
    func setSelected(isSelected: Bool) {
        lblTitle.textColor = isSelected ? Constants.Color.PRIMARY1 : Constants.Color.TITLE
        ivTick.isHidden = isSelected ? false : true
    }
    
}
