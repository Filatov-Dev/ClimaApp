//
//  WeatherManager.swift
//  Clima
//
//  Created by Юрий Филатов on 19.03.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=111aff8a73eea424a95532a8a56651bb&units=metric"

    func featchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        perfomeRequest(urlString: urlString)
        
    }
    
    func perfomeRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decodeer = JSONDecoder()
        do {
            let decodedData = try decodeer.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp )
            
            print(weather.temperatureString)
            
            
        } catch {
            print(error)
        }
    }
}
