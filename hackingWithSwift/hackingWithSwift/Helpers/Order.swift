//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    @Published var items = [MenuItem]()
    @Published var favourites = [MenuItem]()

    // order items
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { partialResult, items in
                partialResult + items.price
            }
        } else {
            return 0
        }
    }

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    // favourites
    func addToFavourite(item: MenuItem) {
        favourites.append(item)
    }

    func removeFromFavourite(item: MenuItem) {
        if let index = favourites.firstIndex(of: item) {
            favourites.remove(at: index)
        }
    }
}
