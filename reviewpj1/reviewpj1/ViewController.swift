//
//  ViewController.swift
//  reviewpj1
//
//  Created by irene on 2022/3/22.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate {

    @IBOutlet weak var lblAlert: UILabel!
    
    
    @IBOutlet weak var tbl1: UITableView!
    
    @IBOutlet weak var tbl2: UITableView!
    
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var arr1 = ["Seattle","NY","SFO","Chicago"]
    var arr2 = ["USA","Canada","Mexico","India","China"]
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
    }
    
    
    // for get location
    @IBAction func getLocationAction(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error in getting location \(error.localizedDescription)")
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        print(lat)
        print(lng)
        
        lblLatitude.text = "Latitude: \(lat)"
        lblLongitude.text = "Longitude: \(lng)"
        
        getAddress(location: location)
        
        
    }
    
    // button get address
    func getAddress( location: CLLocation){
        
        let clGeocoder = CLGeocoder()
        
        clGeocoder.reverseGeocodeLocation(location) { placeMarks, error in
            if error != nil {
                self.lblAddress.text = "Unable to get Address"
                return
            }
            
            guard let place = placeMarks?[0] else { return }
            
            var address = ""
            if place.name != nil {
                address += place.name! + ", "
            }
            if place.locality != nil {
                address += place.locality! + ", "
            }
            if place.subLocality != nil {
                address += place.subLocality! + ", "
            }
            if place.postalCode != nil {
                address += place.postalCode! + ", "
            }
            if place.country != nil{
                address += place.country! + ", "
            }
       
            
            print(address)
            self.lblAddress.text = address
            
        }
        
    }
    
    // display the row element
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tbl1 {
            return arr1.count
        } else {
            return arr2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tbl1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            cell.textLabel?.text = arr1[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.textLabel?.text = arr2[indexPath.row]
            return cell
        }
        
    }
    
    
    // delete some row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        
        if editingStyle == .delete {
            
            if tableView == tbl1 {
                arr1.remove(at: indexPath.row)
            } else {
                arr2.remove(at:indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    
    // add alert controller
    
    @IBAction func pressMe(_ sender: Any) {
        
        var txtField: UITextField?
        
        let alertController = UIAlertController(title: "Sample Alert Controller", message: "Simple Message", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title:"OK", style: .default) {
            action in print(" OK Button pressed")
            self.lblAlert.text = txtField?.text
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel){
            action in print("Cancel Button pressed")
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField{ lblTextField in lblTextField.placeholder = "Type sth"
            txtField = lblTextField
        }
        
        self.present(alertController, animated: true, completion: nil)
        
    }// add alert controller
    
}

