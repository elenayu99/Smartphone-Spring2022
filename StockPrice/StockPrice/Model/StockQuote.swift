//
//  StockQuote.swift
//  StockPrice
//
//  Created by irene on 2022/4/10.
//

import Foundation

class StockQuote {
    
    
    init(_ symbol : String){
            self.symbol = symbol
        }
    var companyName: String = ""
    var symbol : String = ""
    var price : Float = 0.0
    var dayHight: Float = 0.0
    var dayLow: Float = 0.0
}
