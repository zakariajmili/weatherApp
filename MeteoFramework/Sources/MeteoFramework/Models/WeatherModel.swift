//
//  WeatherModel.swift
//  MeteoProject (iOS)
//
//  Created by zakariae jmili on 16/07/2022.
//

import Foundation

struct APIResponse: Decodable {
    let cod: Int
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}
