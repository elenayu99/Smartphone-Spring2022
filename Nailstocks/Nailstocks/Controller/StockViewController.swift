//
//  StockViewController.swift
//  Nailstocks
//
//  Created by irene on 2022/2/20.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

   
    @IBOutlet weak var txtStock: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func getStockPrice(_ sender: Any) {
        
        
        guard let symbol = txtStock.text else{return}
        
        
        
        let url = "\(shortQuote)\(symbol.uppercased())?apikey=\(apiKey)"
        
        print(url)
        
        SwiftSpinner.show("Getting Stock Value and number of share for \(symbol)")
        AF.request(url).responseJSON { reponse in
            SwiftSpinner.hide(nil)
                   if reponse.error != nil {
                       print(reponse.error!)
                       return
                   }
                   // If I am here then I have got the data
                   
                   let stocks = JSON(reponse.data!).array
                   
            guard let stock = stocks!.first else {return}
                   
                   print(stocks)
                   let quote = EnterpriseValue()
            quote.symbol = stock["symbol"].stringValue
            quote.numberOfShares = stock["numberOfShares"].intValue
            quote.stockPrice = stock["stockPrice"].floatValue
            
            self.lblStockPrice.text = "\(quote.symbol): \(quote.stockPrice) $ - \(quote.numberOfShares) shares"

        }
    }
}
