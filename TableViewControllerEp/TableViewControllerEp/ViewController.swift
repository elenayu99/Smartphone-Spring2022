//
//  ViewController.swift
//  TableViewControllerEp
//
//  Created by yi yu on 2/4/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images = ["Seattle1","Seattle2","Seattle3","Seattle4","Seattle5","Seattle6","Seattle7"]
    
    let imageNames = ["image1","image2","image3","image4","image5","image6","image7"]
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblView.text = imageNames[indexPath.row]
        
        return cell
    }
    
}
