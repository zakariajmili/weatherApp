//
//  WeatherViewModel.swift
//  MeteoProject (iOS)
//
//  Created by zakariae jmili on 16/07/2022.
//

import Foundation
import MeteoFramework

private let API_KEY = "415ab685e2a0676f37c90214034cb866"
private let defaultIcon = "-"
private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain": "🌧",
    "Snow": "❄️",
    "Clear": "☀️",
    "Clouds" : "☁️",
]

class WeatherViewModel: ObservableObject {
    @Published var townName: String = ""
    @Published var cityName: String = "-"
    @Published var temperature: String = "-"
    @Published var weatherDescription: String = "-"
    @Published var weatherIcon: String = defaultIcon
    @Published var shouldShowWeatherError: Bool = false
    
    public let weatherService: WeatherService
    
    init(townName: String) {
        self.townName = townName
        self.weatherService = WeatherService(apiKey: API_KEY)
    }
    
    func refresh() {
        weatherService.loadWeatherData(townName: self.townName, { weather, error in
            DispatchQueue.main.async {
                if let _ = error {
                    self.shouldShowWeatherError = true
                    return
                }
                
                guard let weather = weather else {
                    self.shouldShowWeatherError = true
                    return
                }
                
                self.shouldShowWeatherError = false
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)ºC"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        })
    }
}
