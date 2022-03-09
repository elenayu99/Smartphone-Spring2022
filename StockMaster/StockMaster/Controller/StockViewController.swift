//
//  StockViewController.swift
//  StockMaster
//
//  Created by irene on 2022/3/9.
//

import UIKit
import RealmSwift

class StockViewController: UIViewController {
    
    let stockArr = ["FB","MSFT","GOOG","AMZN"]
    
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
