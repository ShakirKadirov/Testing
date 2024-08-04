//
//  CurrentWeatherAPIModel.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import Foundation

struct CurrentWeatherAPIModel: Codable {
    let location: Location
    let current: Current
    
    struct Location: Codable {
        let name: String
        let region: String
        let country: String
        let localtime: String
    }
    
    struct Current: Codable {
        let temp_c: Double
        let condition: Condition
        
        struct Condition: Codable {
            let text: String
        }
    }
}


