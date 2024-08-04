//
//  ForecastView.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import SwiftUI

struct ForecastView: View {
    let dailyWeatherList: [DailyWeather]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(dailyWeatherList) { dailyWeather in
                    DailyWeatherView(dailyWeather: dailyWeather)
                }
            }
            .padding()
        }
    }
}




