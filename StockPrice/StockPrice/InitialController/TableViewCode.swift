//
//  TableViewCode.swift
//  StockPrice
//
//  Created by irene on 2022/4/10.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = stocksModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
        
        guard let stockModel = stocksModel?[indexPath.row] else {return cell}

        if indexPath.row == 0 {
            cell.lblSymbol.text = "AAPL"
            cell.lblCompany.text = "APPLE.LLC"
            
        }else {
            cell.lblSymbol.text = stockModel.symbol
            cell.lblCompany.text = stockModel.companyName
        }
        
        //cell.lblCompany.text = stockModel.companyName
        //cell.lblSymbol.text = stockModel.symbol
    
        cell.symbol = stockModel.symbol
        cell.company = stockModel.companyName
        cell.sendStockDelegate = self
     
     
        return cell
    }
    
}
