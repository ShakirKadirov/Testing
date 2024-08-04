//
//  DailyWeatherView.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import SwiftUI

struct DailyWeatherView: View {
    let dailyWeather: DailyWeather
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dailyWeather.dayOfWeek)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.cardTextColor)
                
                Text(dailyWeather.weatherDescription)
                    .padding(.top)
                    .font(.subheadline)
                    .foregroundColor(.cardTextColor)
            }
            
            Spacer()
            
            VStack(alignment: .center) {
                Image(systemName: dailyWeather.weatherIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(dailyWeather.iconColor) 

                Text(dailyWeather.temperature)
                    .font(.subheadline)
                    .foregroundColor(.cardTextColor)
            }
        }
        .padding()
        .background(Color.cardBackgroundColor)
        .cornerRadius(30)
    }
}

