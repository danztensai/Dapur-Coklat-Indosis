//
//  CakeTableViewCell.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 4/17/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit


class CakeTableViewCell: UITableViewCell {

    // MARK : Properties
    @IBOutlet weak var cakeImage: UIImageView!
    @IBOutlet weak var cakeLabel: UILabel!
    
    @IBOutlet weak var btnAddCart: UIButton!
    
    @IBAction func addToCart(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
