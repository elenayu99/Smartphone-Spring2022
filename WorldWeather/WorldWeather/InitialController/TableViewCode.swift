//
//  TableViewCode.swift
//  WorldWeather
//
//  Created by irene on 2022/4/5.
//


import UIKit
import Foundation

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cities[indexPath.row]
        
        return cell
        
    }

}
