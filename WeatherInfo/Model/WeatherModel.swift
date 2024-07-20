//
//  WeatherModel.swift
//  WeatherInfo
//
//  Created by Aryan Vasudeva on 17/07/2024.
//

import Foundation

struct WeatherModel{
    let name: String
    let conditionID: Int
    let description: String
    let temperature: Double
    
    var conditionName : String {
        switch conditionID {
            
            case 200...232://thunderStorm
                return "cloud.bolt.rain"
            case 300...321://drizzle
                return "cloud.drizzle"
            case 500...531://rain
                return "cloud.rain"
            case 600...622://snow
                return "cloud.snow"
            case 701...781://fog
                return "cloud.fog"
            case 800: //clear
                return "sun.max"
            case 801...804://cloud cover
                return "cloud"
            default:
                return "sun.min"
            }
    }
    
    var temperatureString : String{
        let temp = String(format: "%.1f", temperature)
        return temp
    }
    
    
    
}
