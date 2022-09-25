//
//  TableViewCell.swift
//  EmircanSaglam-odev3
//
//  Created by Emircan saglam on 25.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var postTitleLabel: UILabel!
    @IBOutlet private(set) weak var postDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
