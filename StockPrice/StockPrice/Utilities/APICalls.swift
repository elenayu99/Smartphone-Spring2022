//
//  APICalls.swift
//  StockPrice
//
//  Created by irene on 2022/4/10.
//

import Foundation
import SwiftyJSON
import Alamofire
import PromiseKit

func getStockData(_ symbol : String) -> Promise<StockQuote>{
    
    let url = "\(urlCheckQuote)\(symbol.uppercased())?apikey=\(apiKey)"
    
        return Promise<StockQuote> { seal -> Void in
            
            AF.request(url).responseJSON { response in
                
                if response.error != nil {
                    seal.reject(response.error!)
                }
                
                let currentStockModel = StockQuote("")
                let currentStockArray = JSON(response.data!).arrayValue
                
                guard let currentStock = currentStockArray.first else
                {return seal.fulfill(currentStockModel)}
                
                currentStockModel.companyName = currentStock["name"].stringValue
                currentStockModel.symbol = currentStock["symbol"].stringValue
                currentStockModel.price = currentStock["price"].floatValue
                currentStockModel.dayHight = currentStock["dayHigh"].floatValue
                currentStockModel.dayLow = currentStock["dayLow"].floatValue
                seal.fulfill(currentStockModel)

            }// end of response

    }// end of promise
    
}
