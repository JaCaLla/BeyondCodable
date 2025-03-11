//
//  YamlView.swift
//  BeyondCodable
//
//  Created by Javier Calatrava on 11/3/25.
//

import SwiftUI
import Yams

struct YamlView: View {
    @State private var people: [Person] = []

       func loadPeople() {
           let json = """
           - name: Sebastián
             age: 32
           - name: Ana
             age: 26
           - name: Pedro
             age: 35
           """
           
           let data = Data(json.utf8)
           
           do {
               let decodedPeople = try YAMLDecoder().decode([Person].self, from: data)
               self.people = decodedPeople
           } catch {
               print("\(error)")
           }

       }

       var body: some View {
           NavigationView {
               PeopleListView(people: people)
               .navigationTitle("Persons List (Yaml)")
           }
           .task {
               loadPeople()
           }
       }
}

#Preview {
    YamlView()
}
