# Meteo project

This Workspace is simply project that contains a weather frameworks and application 

Weather framework gives you access the OpenWeatherMap service's APIs in your iOS

## How to use:

To normal working OpenWeatherMapKit must be initialized with your API token.

You can use following method to initialize OpenWeatherMapKit. Just replace `[YOUR API TOKEN]` by your own API token which can be retrieved from https://home.openweathermap.org/api_keys:
```swift
        WeatherService(apiKey: "[API_KEY]")
```

##### Get weather by City
You can load weather data for specific city by it's name:
```swift
        weatherService.loadWeatherData(townName: "Paris", { weather, error in
            DispatchQueue.main.async {
                if let _ = error {
                    ...
                    return
                }
                
                guard let weather = weather else {
                    ...
                    return
                }
                
                ...
            }
        })
}
```
