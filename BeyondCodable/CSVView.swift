//
//  CSVView.swift
//  BeyondCodable
//
//  Created by Javier Calatrava on 11/3/25.
//

import SwiftUI

struct CSVView: View {
    @State private var people: [Person] = []
    
    func loadPeople() {
        let csvString = """
                name,age
                Ricardo,40
                Priscila,25
                Carlos,35
                """

        let lines = csvString.components(separatedBy: "\n")
            var persons: [Person] = []

            for line in lines.dropFirst() { // Remove header
                let values = line.components(separatedBy: ",")
                if values.count == 2, let age = Int(values[1]) {
                    persons.append(Person(name: values[0], age: age))
                }
            }
        people = persons
    }
    
    var body: some View {
        NavigationView {
            PeopleListView(people: people)
            .navigationTitle("Persons List (CSV)")
        }
        .task {
            loadPeople()
        }
    }
}

#Preview {
    CSVView()
}
