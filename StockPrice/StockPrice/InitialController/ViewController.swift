//
//  ViewController.swift
//  StockPrice
//
//  Created by irene on 2022/4/10.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire
import PromiseKit

class ViewController: UIViewController,SendStockDelegate {
    
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblHigh: UILabel!
    
    @IBOutlet weak var lblLow: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
    
    var stocksModel: [StockQuote]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stocksModel = initializeStocks()
    }
    
    
//    @IBAction func getStockClick(_ sender: Any) {
        
        
 //       getStockData("aapl")
//            .done { quote in
 //               self.lblName.text = quote.companyName
 //               self.lblSymbol.text = quote.symbol
  //              self.lblPrice.text = "price : \(quote.price) $"
  //              self.lblHigh.text = "Day high : \(quote.dayHight) $"
  //              self.lblLow.text = "Day low : \(quote.dayLow) $"
 //           }
 //           .catch { error in
 //               print(error.localizedDescription)
 //           }
 //   }

    
    
    
    // build current stock model
    func initializeStocks() -> [StockQuote]{
        let Apple = StockQuote("AAPL");
        let Facebook = StockQuote("FB");
        let Google = StockQuote("GOOG");
        let Microsoft = StockQuote("MSFT");
        let Amazon = StockQuote("AMZN");


       var modelArr = [StockQuote]()
          
          modelArr.append(Apple)
          modelArr.append(Facebook)
          modelArr.append(Google)
          modelArr.append(Microsoft)
          modelArr.append(Amazon)

          return modelArr
      }
    
    
    // Send stock Data
    func sendStockData(_ currentStockModel: StockQuote) {
        lblName.text = "\(currentStockModel.companyName)"
        lblPrice.text = "Price: \(currentStockModel.price) $"
        lblHigh.text = "Day high: \(currentStockModel.dayHight) $"
        lblLow.text = "Day low: \(currentStockModel.dayLow) $"
        lblSymbol.text = "Symbol: \(currentStockModel.symbol)"
    }
    

}

