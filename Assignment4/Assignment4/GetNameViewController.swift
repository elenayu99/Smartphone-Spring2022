//
//  GetNameViewController.swift
//  Assignment4
//
//  Created by yi yu on 2/17/22.
//

import UIKit

protocol SendFirstNameAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName : String)
}

class GetNameViewController: UIViewController {
    
    var firstName: String?
    var lastName: String?
    
    var sendFirstAndLastNameDelegate : SendFirstNameAndLastNameDelegate?

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let firstName = firstName else {
            return
        }
        
        guard let lastName = lastName else {
            return
        }
        
        txtFirstName.text = firstName
        txtLastName.text = lastName


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveName(_ sender: Any) {
        
        guard let first = txtFirstName.text else {return}
        guard let last  = txtLastName.text else {return}
        
        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: first, lastName: last)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
