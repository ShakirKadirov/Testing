//
//  DailyWeather.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import SwiftUI

struct DailyWeather: Identifiable {
    let id = UUID()
    let dayOfWeek: String
    let weatherDescription: String
    let weatherIcon: String
    let temperature: String
    let iconColor: Color 
}

