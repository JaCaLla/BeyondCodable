//
//  ContentView.swift
//  BeyondCodable
//
//  Created by Javier Calatrava on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                JSONView()
                    .tabItem {
                        Label("JSON", systemImage: "1.circle")
                    }
                XMLView()
                    .tabItem {
                        Label("XML", systemImage: "2.circle")
                    }
                CSVView()
                    .tabItem {
                        Label("CSV", systemImage: "3.circle")
                    }
                YamlView()
                    .tabItem {
                        Label("Yaml", systemImage: "4.circle")
                    }
                Plist()
                    .tabItem {
                        Label("Plist", systemImage: "5.circle")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
