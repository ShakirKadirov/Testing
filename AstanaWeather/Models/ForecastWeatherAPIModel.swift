//
//  ForecastWeatherAPIModel.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import Foundation

struct ForecastWeatherAPIModel: Codable {
    let forecast: Forecast
    
    struct Forecast: Codable {
        let forecastday: [ForecastDay]
        
        struct ForecastDay: Codable {
            let date: String
            let day: Day
            
            struct Day: Codable {
                let avgtemp_c: Double
                let condition: Condition
                
                struct Condition: Codable {
                    let text: String
                }
            }
        }
    }
}

