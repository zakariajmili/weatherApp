//
//  WeatherView.swift
//  MeteoProject (iOS)
//
//  Created by zakariae jmili on 16/07/2022.
//

import SwiftUI
import MeteoFramework

struct WeatherView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            Text(weatherViewModel.cityName)
                .font(.largeTitle)
                .padding()
            Text(weatherViewModel.temperature)
                .font(.system(size: 70))
                .bold()
            Text(weatherViewModel.weatherIcon)
                .font(.largeTitle)
                .padding()
            Text(weatherViewModel.weatherDescription)
        }
        .alert(isPresented: $weatherViewModel.shouldShowWeatherError) {
            Alert(
                title: Text("Oops!"),
                message: Text("Ville introuvable, veuillez vérifier votre saisie."),
                dismissButton: .default(Text("Ok"))
            )
        }
        .onAppear(perform: weatherViewModel.refresh)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weatherViewModel: WeatherViewModel(townName: String()))
    }
}
