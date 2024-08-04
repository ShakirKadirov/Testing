//
//  MockData.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import Foundation
import SwiftUI

struct MockData {
    static let dailyWeatherList: [DailyWeather] = [
        DailyWeather(dayOfWeek: "Mon", weatherDescription: "Sunny", weatherIcon: "sun.max.fill", temperature: "25°C"),
        DailyWeather(dayOfWeek: "Tue", weatherDescription: "Partly Cloudy", weatherIcon: "cloud.sun.fill", temperature: "22°C"),
        DailyWeather(dayOfWeek: "Wed", weatherDescription: "Rainy", weatherIcon: "cloud.rain.fill", temperature: "19°C"),
        DailyWeather(dayOfWeek: "Thu", weatherDescription: "Stormy", weatherIcon: "cloud.bolt.rain.fill", temperature: "18°C"),
        DailyWeather(dayOfWeek: "Fri", weatherDescription: "Snowy", weatherIcon: "snow", temperature: "0°C"),
        DailyWeather(dayOfWeek: "Sat", weatherDescription: "Windy", weatherIcon: "wind", temperature: "15°C"),
        DailyWeather(dayOfWeek: "Sun", weatherDescription: "Clear", weatherIcon: "sun.max.fill", temperature: "28°C")
    ]
}
