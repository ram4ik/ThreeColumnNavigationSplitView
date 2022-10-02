//
//  ContentView.swift
//  ThreeColumnNavigationSplitView
//
//  Created by Ramill Ibragimov on 02.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var someData = NewData.exampleData
    @State private var someDataCategory: NewData?
    @State private var selection: String?
    
    var body: some View {
        NavigationSplitView {
            List(someData, selection: $someDataCategory) { category in
                Text(category.name).tag(category)
            }
        } content: {
            List(someDataCategory?.details ?? [], id: \.self, selection: $selection) { data in
                Text(data)
            }
        } detail: {
            Text(selection ?? "Choose a data")
        }
        .navigationSplitViewStyle(.prominentDetail)
    }
}

struct NewData: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let details: [String]
}

extension NewData {
    static var exampleData: [NewData] {
    [
        .init(name: "One", details: ["First 1", "First 2", "First 3"]),
        .init(name: "Two", details: ["Second 1", "Second 2", "Second 3"]),
        .init(name: "Three", details: ["Third 1", "Third 2", "Third 3"]),
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
