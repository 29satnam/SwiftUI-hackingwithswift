//
//  ItemDetail.swift
//  hackingWithSwift
//
//  Created by Satnam on 20/06/22.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    let item: MenuItem
    
    var body: some View {
        List {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    //.padding()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    //.padding()
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                //.padding()
            Button("Add to favourite") {
                order.addToFavourite(item: item)
            }
            
            Button("Order This") {
                order.add(item: item)
            }

        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
