//
//  WeatherCardMapper.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import Foundation

struct WeatherCardMapper {
    static func map(apiModel: CurrentWeatherAPIModel) -> WeatherCard {
        let dayOfWeek = "Today"
        let weatherDescription = apiModel.current.condition.text
        
        let iconDetails = IconMapper.iconDetails(for: weatherDescription)
        
        return WeatherCard(dayOfWeek: dayOfWeek,
                           weatherDescription: weatherDescription,
                           weatherIcon: iconDetails.name,
                           temperature: "\(apiModel.current.temp_c)°C",
                           iconColor: iconDetails.color)
    }
}




