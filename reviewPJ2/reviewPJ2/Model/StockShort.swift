//
//  StockShort.swift
//  reviewPJ2
//
//  Created by irene on 2022/3/24.
//

import Foundation
import RealmSwift

class StockShort : Object{
    @objc dynamic var symbol : String = ""
    @objc dynamic var price : Float = 0.0
    @objc dynamic var volume : Int = 0
    
    override static func primaryKey()-> String? {
        return "symbol"
    }
}
