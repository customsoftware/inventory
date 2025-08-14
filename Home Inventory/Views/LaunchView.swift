//
//  LaunchView.swift
//  Home Inventory
//
//  Created by Kenneth Cluff on 8/13/25.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack(alignment: .top) {
                Button {
                    print("Home List")
                } label: {
                    Text("Home List")
                }
                Spacer()
                Button {
                    print("Shopping List")
                } label: {
                    Text("Shopping List")
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                Button {
                    print("Add Items")
                } label: {
                    Text("Add Items")
                }
                Spacer()
                Button {
                    print("Remove Items")
                } label: {
                    Text("Remove Items")
                }
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LaunchView()
}
