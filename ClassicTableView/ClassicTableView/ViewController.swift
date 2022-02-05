//
//  ViewController.swift
//  ClassicTableView
//
//  Created by yi yu on 2/4/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    
    let arr = ["Mark", "Bill", "Peter", "John", "Tim", "Mark", "Bill", "Peter", "John", "Tim", "Mark", "Bill", "Peter", "John", "Tim", "Mark", "Bill", "Peter", "John", "Tim", "Mark", "Bill", "Peter", "John", "Tim", "Mark", "Bill", "Peter", "John", "Tim"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    

}

