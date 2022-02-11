//
//  ViewController.swift
//  SegueExample
//
//  Created by yi yu on 2/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segueToSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            
            secondVC.welcomeStr = "Welcome \(txtFirstName.text!), \(txtLastName.text!)"
            
        }
    }


}

