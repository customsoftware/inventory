//
//  FoodRowSwiftUIView.swift
//  Home Inventory
//
//  Created by Kenneth Cluff on 7/18/25.
//

import SwiftUI

struct FoodRowSwiftUIView: View {
    private var foodName: String
    private var qtyOnHand: Int32
    
    init(foodName: String, qtyOnHand: Int32) {
        self.foodName = foodName
        self.qtyOnHand = qtyOnHand
    }
    
    var body: some View {
        HStack {
            Text(foodName)
            Spacer()
            Text("\(qtyOnHand) on hand")
        }
        .padding()
    }
}

#Preview {
    FoodRowSwiftUIView(foodName: "Test", qtyOnHand: 5)
}
