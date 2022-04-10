//
//  APICalls.swift
//  WorldWeather
//
//  Created by irene on 2022/4/6.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftSpinner
import PromiseKit

extension ViewController {
    
    func getLocationData(_ url : String) -> Promise<LocationModel>{

            return Promise<LocationModel> { seal -> Void in
                
                AF.request(url).responseJSON { response in
                    
                    if response.error != nil {
                        seal.reject(response.error!)
                    }
                    
                    let location = LocationModel()
                    // I will get data here
                    
                    if let data = response.data, let utf8Text = String(data: data, encoding:.utf8){

                       let weatherData = JSON.init(parseJSON: utf8Text)

                       location.key = weatherData["Key"].stringValue
                       location.city = weatherData["EnglishName"].stringValue
                       location.state = weatherData["AdministrativeArea"]["ID"].stringValue
                       location.country = weatherData["Country"]["ID"].stringValue

                       print(weatherData)

                    }
                    
                    
                    seal.fulfill(location) // I am fulfilling the promise

                }// end of response

        }// end of promise
        
    }// end of function
}
    
