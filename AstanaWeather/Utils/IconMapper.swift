//
//  IconMapper.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import SwiftUI

struct IconMapper {
    static func iconDetails(for weatherDescription: String) -> (name: String, color: Color) {
        switch weatherDescription.lowercased() {
        case "sunny", "clear":
            return ("sun.max.fill", .yellow)
        case "partly cloudy":
            return ("cloud.fill", .white)
        case "partly":
            return ("cloud.fill", .white)
        case "rainy":
            return ("cloud.rain.fill", .blue)
        case "snowy":
            return ("snow", .white)
        case "thundery outbreaks in nearby":
            return ("sun.max.fill", .white)
        case "patchy rain nearby":
            return ("cloud.sun.rain", .white)
        case "moderate rain":
            return ("cloud.heavyrain", .blue)
            
        case "light rain shower":
            return ("cloud.rain", .blue)

        default:
            return ("questionmark", .gray)
        }
    }
}

    
