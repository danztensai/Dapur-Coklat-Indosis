//
//  Cake.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 4/11/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Cake {
    //MARK : Properties
    var id_product :String
    var product :String
    var description :String
    var imageURL : String
   
    
    var variant = [Variant]()
    
    //MARK : Initialization
    init?(id_product:String,product:String,description:String,imageURL:String,variant:[Variant]) {
        
        if product.isEmpty {
            return nil
        }
        
        self.id_product = id_product
        self.product = product
        self.description = description
        self.imageURL = imageURL
        self.variant = variant
    }
    
}
