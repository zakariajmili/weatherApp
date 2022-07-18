//
//  AddTownView.swift
//  MeteoProject (iOS)
//
//  Created by zakariae jmili on 16/07/2022.
//

import SwiftUI

struct AddTownView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var townListViewModel: TownListViewModel
    @State var townFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Entrez le Nom de la ville..", text: $townFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(red: 255, green: 255, blue: 255))
                    .cornerRadius(10)
                
                Button(
                    action: saveButtonPressed,
                    label: {
                        Text("Enregistrer")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                )
            }
            .padding(10)
        }
        .navigationTitle("Ajouter une ville")
    }
    
    func saveButtonPressed() {
        townListViewModel.addItem(name: townFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTownView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTownView(townListViewModel: TownListViewModel())
        }
    }
}
