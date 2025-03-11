//
//  JSONView.swift
//  BeyondCodable
//
//  Created by Javier Calatrava on 10/3/25.
//

import SwiftUI

struct JSONView: View {
    @State private var people: [Person] = []

       func loadPeople() {
           let json = """
           [
               {"name": "Juan", "age": 30},
               {"name": "Ana", "age": 25},
               {"name": "Carlos", "age": 35}
           ]
           """
           
           let data = Data(json.utf8)
           
           do {
               let decodedPeople = try JSONDecoder().decode([Person].self, from: data)
               self.people = decodedPeople
           } catch {
               print("\(error)")
           }

       }

       var body: some View {
           NavigationView {
               PeopleListView(people: people)
               .navigationTitle("Persons List (JSON)")
           }
           .task {
               loadPeople()
           }
       }
}

#Preview {
    JSONView()
}
