//
//  WeatherViewModel.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weatherCard: WeatherCard?
    @Published var forecastWeather: [DailyWeather] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var weatherService: WeatherService
    private var cancellables = Set<AnyCancellable>()
    
    init(weatherService: WeatherService = WeatherService()) {
        self.weatherService = weatherService
        fetchWeather()
        fetchForecastWeather()
    }
    
    func fetchWeather() {
        isLoading = true
        weatherService.fetchCurrentWeather(for: "Astana")
            .sink(receiveCompletion: { [weak self] completion in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }, receiveValue: { [weak self] weatherAPIModel in
                let weatherCard = WeatherCardMapper.map(apiModel: weatherAPIModel)
                DispatchQueue.main.async {
                    self?.weatherCard = weatherCard
                }
            })
            .store(in: &cancellables)
    }
    
    func fetchForecastWeather() {
        isLoading = true

        weatherService.fetchForecastWeather(for: "Astana")
            .sink(receiveCompletion: { [weak self] completion in
                DispatchQueue.main.async {
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                    self?.isLoading = false // Stop loading when done
                }
            }, receiveValue: { [weak self] forecastAPIModel in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                let dayFormatter = DateFormatter()
                dayFormatter.dateFormat = "EEEE" // Full name of the day of the week
                
                let dailyWeatherList = forecastAPIModel.forecast.forecastday.map { day in
                    let date = dateFormatter.date(from: day.date)
                    let dayOfWeek = dayFormatter.string(from: date ?? Date())
                    
                    let iconDetails = IconMapper.iconDetails(for: day.day.condition.text)
                    
                    return DailyWeather(
                        dayOfWeek: dayOfWeek,
                        weatherDescription: day.day.condition.text,
                        weatherIcon: iconDetails.name,
                        temperature: "\(Int(day.day.avgtemp_c))°C", iconColor: iconDetails.color
                    )
                }
                
                DispatchQueue.main.async {
                    self?.forecastWeather = dailyWeatherList
                }
            })
            .store(in: &cancellables)
    }

}
