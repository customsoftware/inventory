//
//  InventoryDetailView.swift
//  Home Inventory
//
//  Created by Kenneth Cluff on 7/26/25.
//

import SwiftUI
import CoreData

struct InventoryDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var foodItem: FoodItem
    @State private var foodName: String = ""
    @State private var shortTitle: String = ""
    @State private var foodNotes: String = ""
    @State private var barCode: String = ""
    @State private var qtyOnHand: Int32 = 0
    @State private var reorderLevel: Int32 = 0
    
    private var viewModel: ViewModel
    
    init(foodItem: FoodItem) {
        self.viewModel = ViewModel(item: foodItem)
        _foodItem = .init(wrappedValue: foodItem)
    }
    
    var body: some View {
        
        HStack {
            Button {
                saveToCoreData()
            } label: {
                Text("Save")
            }
            Spacer()
        }
        .padding()
        
        Form {
            TextField(text: $foodName, prompt: Text("Enter name of food")) {
                Text("Food Name")
            }
            TextField(text: $shortTitle, prompt: Text("Short title")) {
                Text("Short Title")
            }
            TextField(text: $barCode, prompt: Text("Bar Code")) {
                Text("Bar Code")
            }
            TextField(text: $foodNotes, prompt: Text("Notes about this food item")) {
                Text("Notes")
            }
            HStack {
                Text(verbatim: "Enter Quantity on Hand:")
                Spacer()
                TextField("Enter Quantity on Hand", value: $qtyOnHand, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
            }
            HStack {
                Text(verbatim: "Enter Reorder Level:")
                Spacer()
                TextField("Enter Quantity on Hand", value: $reorderLevel, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
            }
        }
        .onAppear {
            foodName = foodItem.name ?? ""
            foodNotes = foodItem.notes ?? ""
            shortTitle = foodItem.shortLabel ?? ""
            barCode = foodItem.barcode ?? ""
            qtyOnHand = foodItem.quantity
            reorderLevel = foodItem.reorderLevel
        }
        .onDisappear {
            saveToCoreData()
        }
    }
    
    @MainActor
    func saveToCoreData() {
        foodItem.name = foodName.isEmpty ? nil : foodName
        foodItem.notes = foodNotes.isEmpty ? nil : foodNotes
        foodItem.shortLabel = shortTitle.isEmpty ? nil : shortTitle
        foodItem.barcode = barCode.isEmpty ? nil : barCode
        foodItem.quantity = qtyOnHand
        foodItem.reorderLevel = reorderLevel
        do {
            try viewContext.save()
        } catch {
            print("Saving failed.")
        }
    }
}

#Preview {
    let context: NSManagedObjectContext = .init(concurrencyType: .mainQueueConcurrencyType)
    let newItem = FoodItem(context: context)
    InventoryDetailView(foodItem: newItem)
}
