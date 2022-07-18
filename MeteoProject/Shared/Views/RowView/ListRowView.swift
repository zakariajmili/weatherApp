//
//  ListRowView.swift
//  MeteoProject (iOS)
//
//  Created by zakariae jmili on 16/07/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: TownModel
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        }
    }
}
