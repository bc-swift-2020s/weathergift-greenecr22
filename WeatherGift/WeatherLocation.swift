//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Christopher Greene on 3/9/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import Foundation


class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getData() {
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIKeys.DarkSkyKey)/\(coordinates)"
        
        guard let url = URL(string: urlString) else {
            print("Error: Could not create string.")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("\(json)")
            } catch {
                print("JSON Error.")
            }
            
        }
        task.resume()

    }
    
}
