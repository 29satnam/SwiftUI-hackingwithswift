//
//  Favourites.swift
//  hackingWithSwift
//
//  Created by Satnam on 22/06/22.
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        List {
            Section(header: Text("Favourites")) {
                ForEach(order.favourites) {
                    FavourtiteRow(item: $0)
                }
                .onDelete(perform: removeFavourite)
            }
        }
        .navigationTitle(Text("Favourites"))
    }
    
    func removeFavourite(indexSet: IndexSet) {
        order.favourites.remove(atOffsets: indexSet)
    }
}

struct FavouriteView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FavouriteView()
        }.environmentObject(Order())
    }
}
