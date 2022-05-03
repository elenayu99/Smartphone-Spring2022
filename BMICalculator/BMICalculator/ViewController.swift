//
//  ViewController.swift
//  BMICalculator
//
//  Created by irene on 2022/5/3.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var feet: UITextField!
    
    @IBOutlet weak var inches: UITextField!
    
    @IBOutlet weak var lblBMI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calculateBMI(_ sender: Any) {
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
        

        let totalHeight = feetValue*12+inchesValue
        
        let bmi = (weightValue*703) / (totalHeight*totalHeight)

        
        var cat = ""
          if bmi < 18.5{
              cat = "Under weight"
          } else if bmi > 18.5 && bmi <= 24.9 {
              cat = "Healthy Weight"
          } else if bmi > 24.9 && bmi <= 29.9  {
              cat = "OverWeight"
          } else if bmi > 29.9 {
              cat = "Obese"
          }
          
          lblBMI.text = "Body mass:" + String(format: "%.2f", bmi) + " - " + cat
    }
    

}

