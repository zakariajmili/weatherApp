//
//  TownListView.swift
//  MeteoProject (iOS)
//
//  Created by zakariae jmili on 16/07/2022.
//

import SwiftUI
import Foundation
import MeteoFramework

struct TownListView: View {
    @ObservedObject var townListViewModel: TownListViewModel
    
    var body: some View {
        List {
            ForEach(townListViewModel.items) { item in
                NavigationLink {
                    WeatherView(weatherViewModel: WeatherViewModel(townName: item.name))
                } label: {
                    ListRowView(item: item)
                }
            }
            .onDelete(perform: townListViewModel.deleteItem)
        }
        .navigationTitle("List des villes")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Ajouter", destination: AddTownView(townListViewModel: townListViewModel))
        )
    }
}

struct TownListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TownListView(townListViewModel: TownListViewModel())
        }
    }
}
