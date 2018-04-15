//
//  Cake.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 4/11/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import Foundation
class Cake {
    //MARK : Properties
    var id_product :String
    var product :String
    var description :String
    var size :String
    var price :String
    
    //MARK : Initialization
    init(id_product:String,product:String,description:String,size:String,price:String) {
        self.id_product = id_product
        self.product = product
        self.description = description
        self.size = size
        self.price = price
    }
    
}
