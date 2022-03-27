//
//  StockViewController.swift
//  reviewPJ2
//
//  Created by irene on 2022/3/25.
//

import UIKit
import RealmSwift

class StockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print(Realm.Configuration.defaultConfiguration.fileURL?.path)
       loadStockValues()
        // Do any additional setup after loading the view.
    }
    
    
    // add data from api to realm db
    @IBAction func addDBAction(_ sender: Any) {
        
        let stock = StockShort()
        stock.symbol = "TSLA"
        stock.price = 915.23
        stock.volume = 23423434
        
        do {
            let realm = try Realm()
            try realm.write({
                realm.add(stock, update: .modified)
            })
            
        } catch {
            print("Error in writing to db")
        }
        
    }
    
    
    // read saved data from realm
    
    func loadStockValues(){
        
        do {
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            
            print(stocks)
            
        } catch {
            print("Error in reading from Realm")
        }
    }
    
    func getTslaStock() -> StockShort {
        
        
        do {
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            
            print(stocks)
            
            for stock in stocks {
                if stock.symbol == "TSLA" {
                    return stock
                }
            }
           
        } catch {
            print("Error in reading from Realm")
        }
        return StockShort()
        
    }
    
    func deleteStockFromDB(stock: StockShort){
        
        do {
            
            let realm = try Realm()
            try realm.write({
                realm.delete(stock)
            })
            
        } catch {
            print("Unable to delete from Realm DB")
        }
        
    }
    
    @IBAction func deleteTSLAStock(_ sender: Any) {
        let tsla = getTslaStock()
        deleteStockFromDB(stock: tsla)
    }
    
    
    @IBAction func addStocksAction(_ sender: Any) {
    }
    
    
}
