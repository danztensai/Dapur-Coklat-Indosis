//
//  PlaceTableViewCell.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 5/14/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    //Mark : Properties
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeWorkingHours: UILabel!
    
    @IBOutlet weak var placeAddress: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
