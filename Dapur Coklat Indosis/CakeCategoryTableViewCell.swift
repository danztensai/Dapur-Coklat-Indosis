//
//  CakeCategoryTableViewCell.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 3/18/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit

class CakeCategoryTableViewCell: UITableViewCell {

    
    
    @IBOutlet var cakeLabel: UILabel!
    @IBOutlet var cakeDescription: UITextView!
    @IBOutlet var cakeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
