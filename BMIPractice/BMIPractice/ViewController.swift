//
//  ViewController.swift
//  BMIPractice
//
//  Created by irene on 2022/5/2.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var weight: UITextField!
    
    
    @IBOutlet weak var feet: UITextField!
    
    @IBOutlet weak var inches: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func calculator(_ sender: Any) {
        
        guard var weightValue = Double(weight.text!) else {
            print("the weight is invalid")
            return
        }
        
        guard var feetValue = Double(feet.text!) else {
            print("the feet is invalid")
            return
        }
        
        guard var inchesValue = Double(inches.text!) else {
            print("the inch is invalid")
            return
        }
        
        let kg = weightValue*0.45
        
        let cm = feetValue*30.48 + inchesValue*2.54
        
        let bmi = kg / (cm/100*cm/100)
        
        //label.text = String(bmi)
        label.text = "Body mass:" + String(format: "%.2f", bmi)
      
    }
    
        
        
}

