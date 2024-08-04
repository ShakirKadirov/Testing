//
//  WeatherService.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import Foundation
import Combine

class WeatherService {
    
    func fetchCurrentWeather(for city: String) -> AnyPublisher<CurrentWeatherAPIModel, Error> {
        let apiKey = Config.apiKey
        let url = "https://api.weatherapi.com/v1/current.json"
        let parameters: [String: Any] = ["q": city, "key": apiKey]
        
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        let request = URLRequest(url: components.url!)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: CurrentWeatherAPIModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
     func fetchForecastWeather(for city: String) -> AnyPublisher<ForecastWeatherAPIModel, Error> {
         let apiKey = Config.apiKey
         let url = "https://api.weatherapi.com/v1/forecast.json"
         let parameters: [String: String] = ["q": city, "key": apiKey, "days": "7"]
         
         var components = URLComponents(string: url)!
         components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
         
         let request = URLRequest(url: components.url!)
         
         return URLSession.shared.dataTaskPublisher(for: request)
             .map(\.data)
             .decode(type: ForecastWeatherAPIModel.self, decoder: JSONDecoder())
             .eraseToAnyPublisher()
     }
}

