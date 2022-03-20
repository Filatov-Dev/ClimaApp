//
//  WeatherData.swift
//  Clima
//
//  Created by Юрий Филатов on 19.03.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
// weather[0].description

import UIKit

struct WeatherData: Codable {
    
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp : Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
