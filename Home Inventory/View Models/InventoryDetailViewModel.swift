//
//  InventoryDetailViewModel.swift
//  Home Inventory
//
//  Created by Kenneth Cluff on 7/26/25.
//

import Foundation
import SwiftUI

extension InventoryDetailView {
    class ViewModel: ObservableObject {
        @Published var foodItem: FoodItem
        
        init(item: FoodItem) {
            self.foodItem = item
        }
    }
}
