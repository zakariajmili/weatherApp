//
//  UTestWeatherViewModel.swift
//  Tests iOS
//
//  Created by zakariae jmili on 17/07/2022.
//

import XCTest
import MeteoFramework

class UTestWeatherViewModel: XCTestCase {
    
    func test_WeatherViewModel_refresh() {
        let weatherService = WeatherService()
        let weatherViewModel = WeatherViewModel(weatherService: weatherService, townName: "Paris")
        weatherViewModel.refresh()
        XCTAssertEqual(weatherViewModel.shouldShowWeatherError, false)
    }
}
