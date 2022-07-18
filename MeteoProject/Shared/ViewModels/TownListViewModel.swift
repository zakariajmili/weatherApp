//
//  TownListViewModel.swift
//  MeteoProject (iOS)
//
//  Created by zakariae jmili on 16/07/2022.
//

import Foundation

class TownListViewModel: ObservableObject {
    
    @Published var items: [TownModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let townsKey: String = "towns_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: townsKey),
            let savedItems = try? JSONDecoder().decode([TownModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        indexSet.forEach { (i) in
            items.remove(at: i)
        }
    }
    
    func addItem(name: String) {
        let newItem = TownModel(name: name)
        items.append(newItem)
    }
    
    func saveItems() {
        if let encodeDtata = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeDtata, forKey: townsKey);
        }
    }
}
