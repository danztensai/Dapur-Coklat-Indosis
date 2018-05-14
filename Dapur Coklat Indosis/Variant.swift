//
//  Properties.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 4/11/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import Foundation
class Variant {
    //MARK : Properties
    var size :String
    var price :Int
    
    //MARK : Intialize
    init?(size:String,price:Int) {
        self.size = size
        self.price = price
        
    }
    
}
