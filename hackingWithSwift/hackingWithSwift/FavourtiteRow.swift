//
//  FavourtiteRow.swift
//  hackingWithSwift
//
//  Created by Satnam on 22/06/22.
//

import SwiftUI

struct FavourtiteRow: View {
    let item: MenuItem
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.body)
                Text("$\(item.price)")
                    .font(.footnote)
            }
        }

    }
}

struct FavourtiteRow_Previews: PreviewProvider {
    static var previews: some View {
        FavourtiteRow(item: MenuItem.example)
    }
}
