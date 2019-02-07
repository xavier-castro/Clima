//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "17cb2a090fba3cfcf880b83669883b76"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self // self meaning our current class (WeatherViewController)
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters // Good range that doesn't use that much battery
        locationManager.requestWhenInUseAuthorization() // Triggers the authorization popup
        locationManager.startUpdatingLocation() // Async method (Which means it works in the background)
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func getWeatherData(url: String, parameters: [String: String]) {
        // We are using Alamofire to make our HTTP request and handle the response we get from the openweathermap service
        // Snippets by Alamofire to make a get request
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in // Whenever you see in, whatever is inside the scope needs a self (look at updateWeatherData)
            if response.result.isSuccess {
                print("Success! Got the weather data")
                
                let weatherJSON: JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
            } else {
                print("Error \(response.result.error)")
                
                self.cityLabel.text = "Connection Issues"
            }
        }
    }
    

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    func updateWeatherData(json: JSON) {
        let tempResult = json["main"]["temp"]
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    // Method that gets activiated once the locationManager finds a location and what happens after that
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation() // Stop updating location as soon as you get a valid result (saves a LOT of battery)
            locationManager.delegate = nil
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            let params: [String : String] = ["lat": latitude, "lon": longitude, "appid": APP_ID] // Required format to send to weather
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    
    
    //Write the didFailWithError method here:
    // Tells the Delegate that it was unable to retrieve a location value (airplane mode, no internet, etc)
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


