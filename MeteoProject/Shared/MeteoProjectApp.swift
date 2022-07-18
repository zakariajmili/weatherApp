//
//  MeteoProjectApp.swift
//  Shared
//
//  Created by zakariae jmili on 16/07/2022.
//

import SwiftUI
import MeteoFramework

@main
struct MeteoProjectApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TownListView(townListViewModel: TownListViewModel())
            }
        }
    }
}
