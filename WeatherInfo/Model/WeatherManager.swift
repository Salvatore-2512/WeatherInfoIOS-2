//
//  WeatherManager.swift
//  WeatherInfo
//
//  Created by Aryan Vasudeva on 15/07/2024.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    
    var delegate: WeatherManagerDelegate?
    
    let urlAPICall = "https://api.openweathermap.org/data/2.5/weather?appid=7d160d25dffc805454d27050bf87184e&units=metric"
    
    // form the correct URL with the city name at its correct position
    
    func fetchWeather(cityName: String){
        let urlString = "\(urlAPICall)&q=\(cityName)"
        // calling the function that would perform a request to call the API
        performRequest(with: urlString)
    }
    
    //the function that calls the API and gets the data
    
    func performRequest(with urlString: String){
        //making the final URL that will be used to fetch the data
        if let url = URL(string: urlString){
            //creating a URL session
            let session = URLSession(configuration: .default)
            // give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in// using closure
                if (error != nil) {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
//                    let dataString = String(data: safeData, encoding: .utf8)// converting the data type to string
                    // very hard to understand the string format therefore we create a swift object to make it more readable the
                    if let weather = self.parseJSON(safeData) {// this is the unwrapped weather data(unwrapped from the JSON)
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //start the task
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {// this optional so that if the code lands up in the catch part it can return nil
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = WeatherModel(name: decodedData.name, conditionID: decodedData.weather[0].id, description: decodedData.weather[0].description, temperature: decodedData.main.temp)
            let conditionName = weather.conditionName
            print(weather.conditionID)
            print(conditionName)
            let tempString = weather.temperatureString
            return weather
            
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
        
        
    
    
    
}
