//
//  CurrentWeatherView.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    let weatherCard: WeatherCard
    
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .leading) {
                    Text(weatherCard.dayOfWeek)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.cardTextColor)
                    
                    Text(weatherCard.weatherDescription)
                        .padding(.top)
                        .font(.subheadline)
                        .foregroundColor(.cardTextColor)
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Image(systemName: weatherCard.weatherIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(weatherCard.iconColor)
                    
                    Text(weatherCard.temperature)
                        .font(.title)
                        .foregroundColor(.cardTextColor)
                        .foregroundColor(weatherCard.iconColor)

                }
            }
            .padding()
            .background(Color.cardBackgroundColor)
            .cornerRadius(30)
        }
        .padding()
    }
}

