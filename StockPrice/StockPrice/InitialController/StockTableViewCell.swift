//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by irene on 2022/4/10.
//

import UIKit
import PromiseKit



class StockTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCompany: UILabel!
    
  
    @IBOutlet weak var lblSymbol: UILabel!
    
    var company = ""
    var symbol = ""
  
    var sendStockDelegate : SendStockDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    @IBAction func getPriceButton(_ sender: Any) {

        
        getStockData(symbol).done { currentStockModel in
            self.sendStockDelegate?.sendStockData(currentStockModel)
            
        }
        .catch { error in
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
