//
//  WeatherService.swift
//  MeteoProject (iOS)
//
//  Created by zakariae jmili on 16/07/2022.
//

import Foundation

public final class WeatherService: NSObject {
    
    private let API_URL = "https://api.openweathermap.org/data/2.5/"
    private var apiKey: String
    private var completionHandler: ((Weather?, Error?) -> Void)?
    private var dataTask: URLSessionDataTask?
    
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func loadWeatherData(townName: String, _ completionHandler: @escaping((Weather?, Error?) -> Void)) {
        self.completionHandler = completionHandler
        fetchData(forTownName: townName)
    }
    
    private func fetchData(forTownName townName: String) {
        guard let urlString = "\(API_URL)/weather?q=\(townName.replacingOccurrences(of: " ", with: "+"))&appid=\(apiKey)&units=metric"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: urlString) else { return }
        
        dataTask?.cancel()
        
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                self.completionHandler?(nil, error);
                return
            }
            
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                self.completionHandler?(Weather(response: response), nil)
            }
            else {
                self.completionHandler?(nil, nil);
            }
        }
        dataTask?.resume()
    }
}

