//
//  ProtocolSendStockData.swift
//  StockPrice
//
//  Created by irene on 2022/4/10.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ currentStockModel : StockQuote)
}
