//
//  ContentView.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Astana")
                    .font(.system(size: 50))
                    .padding(.leading)
                Spacer()
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                if let weatherCard = viewModel.weatherCard {
                    CurrentWeatherView(weatherCard: weatherCard)
                        .padding(.bottom)
                }
                
                Spacer()
                
                HStack {
                    Text("Forecast for 7 days")
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                }
                
                ForecastView(dailyWeatherList: viewModel.forecastWeather)
            }
        }
        .onAppear {
            viewModel.fetchWeather()
            viewModel.fetchForecastWeather()
        }
    }
}
