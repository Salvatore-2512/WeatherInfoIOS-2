//
//  WeatherManager.swift
//  WeatherInfo
//
//  Created by Aryan Vasudeva on 15/07/2024.
//

import Foundation

struct WeatherManager{
    let urlAPICall = "https://api.openweathermap.org/data/2.5/weather?appid=7d160d25dffc805454d27050bf87184e&units=metric"
    
    // form the correct URL with the city name at its correct position
    
    func fetchWeather(cityName: String){
        let urlString = "\(urlAPICall)&q=\(cityName)"
        // calling the function that would perform a request to call the API
        performRequest(urlString: urlString)
    }
    
    //the function that calls the API and gets the data
    
    func performRequest(urlString: String){
        //making the final URL that will be used to fetch the data
        if let url = URL(string: urlString){
            
            //creating a URL session
            let session = URLSession(configuration: .default)
            
            
            
        }
        
    }
}
