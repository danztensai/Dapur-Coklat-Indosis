//
//  UIImageView.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 3/20/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
