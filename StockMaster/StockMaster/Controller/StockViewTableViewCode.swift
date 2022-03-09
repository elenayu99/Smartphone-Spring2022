//
//  StockViewTableViewCode.swift
//  StockMaster
//
//  Created by irene on 2022/3/9.
//

import Foundation
import UIKit

extension StockViewController:  UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = stockArr[indexPath.row]
        
        return cell
    }
}
