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
        
        let symbol = txtStock.text!
        
        let url = "\(shortQuote)\(symbol)?apikey=\(apiKey)"
        
        print(url)
        
        AF.request(url).responseJSON { reponse in
                   if reponse.error != nil {
                       print(reponse.error!)
                       return
                   }
                   // If I am here then I have got the data
                   
                   let stocks = JSON(reponse.data!).array
                   
                   print(stocks)
        }
    }
}
