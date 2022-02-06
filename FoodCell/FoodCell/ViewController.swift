//
//  ViewController.swift
//  FoodCell
//
//  Created by yi yu on 2/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let images = ["salad1","salad2","salad3","salad4","salad5"]
    
    let foodNames = ["chef salad", "corn salad", "wedge salad", "Squid salad", "tomato salad"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = foodNames[indexPath.row]
        
        return cell
    }
    

}

