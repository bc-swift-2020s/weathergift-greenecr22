//
//  WeatherDetail.swift
//  WeatherGift
//
//  Created by Christopher Greene on 3/23/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import Foundation

class WeatherDetail: WeatherLocation {
    
    struct Result: Codable {
        var timezone: String
        var currently: Currently
        var daily: Daily
        
    }
    
    struct Currently: Codable {
        var temperature: Double
    }
    
    struct Daily: Codable {
        var summary: String
    }
    
    
    var timezone = ""
    var temperature = 0
    var summary = ""
    
    func getData(completed: @escaping () -> () ) {
         let coordinates = "\(latitude),\(longitude)"
         let urlString = "\(APIurls.darkSkyURL)\(APIKeys.DarkSkyKey)/\(coordinates)"
         
         guard let url = URL(string: urlString) else {
             print("Error: Could not create string.")
            completed()
             return
         }
         
         let session = URLSession.shared
         
         let task = session.dataTask(with: url) { (data, response, error) in
             if let error = error {
                 print("ERROR: \(error.localizedDescription)")
             }
             
             
             do {
                
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.timezone = result.timezone
                self.temperature = Int(result.currently.temperature.rounded())
                self.summary = result.daily.summary
             } catch {
                 print("JSON Error.")
             }
            completed()
             
         }
         task.resume()

     }
}
