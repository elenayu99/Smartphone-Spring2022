//
//  StockViewController.swift
//  reviewpj3
//
//  Created by irene on 2022/3/25.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire
import PromiseKit


class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    var temString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getStockPrice(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else {return }
        
        let url = "\(urlShortQuote)\(symbol.uppercased())?apikey=\(apiKey)"
        
        print(url)
        
       SwiftSpinner.show("Getting Stock Value for \(symbol)")
        getStockData(url)
            .done { quote in
                print(quote.price)
                print(quote.volume)
                print(quote.symbol)
                self.lblStockPrice.text = "\(quote.symbol) : \(quote.price) $"
                self.temString = "\(quote.symbol) : \(quote.price) $"
            }
            .catch { error in
                print(error.localizedDescription)
            }


        
    }
    
    // add promise
    func getStockData( _ url : String) -> Promise<QuoteShort>{
        
        return Promise<QuoteShort> { seal -> Void in
            
            AF.request(url).responseJSON { response in
                SwiftSpinner.hide(nil)
                if response.error != nil {
                    seal.reject(response.error!)
                }
                
                let stocks = JSON(response.data!).array
                guard let stock = stocks!.first else { return}
                
                let quote = QuoteShort()
                quote.symbol = stock["symbol"].stringValue
                quote.price = stock["price"].floatValue
                quote.volume = stock["volume"].intValue
                
                seal.fulfill(quote)
            }// the end of response
            
        } // promise end
    }// promise function end!
    
    // go to second view controller
    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecond", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToSecond" {
            
            let secondVC = segue.destination as! SecondViewController
            //secondVC.welcomeStr = "Welcome \(txtName.text!),"
            secondVC.welcomeStr  = self.temString
        }
    }
}
