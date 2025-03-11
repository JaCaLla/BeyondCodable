//
//  XMLView.swift
//  BeyondCodable
//
//  Created by Javier Calatrava on 10/3/25.
//

import SwiftUI
import SWXMLHash

struct XMLView: View {
    @State private var people: [Person] = []

    func loadPeople() {
        let xmlString = """
                <Persons>
                    <Person>
                        <Name>Teresa</Name>
                        <Age>35</Age>
                    </Person>
                    <Person>
                        <Name>Ana</Name>
                        <Age>45</Age>
                    </Person>
                    <Person>
                        <Name>Carlos</Name>
                        <Age>35</Age>
                    </Person>
                </Persons>
                """

        let xml = XMLHash.config { _ in }.parse(xmlString)

        do {
            let fetchedPeople: [Person] = try xml["Persons"].children.map { element in
                let name: String = try element["Name"].value() ?? ""
                let age: Int = try element["Age"].value() ?? -1
                return Person(name: name, age: age)
            }
            people = fetchedPeople
        } catch {
            print("Error decoding XML: \(error)")
        }
    }

    var body: some View {
        NavigationView {
            PeopleListView(people: people)
                .navigationTitle("Persons List (XML)")
        }
            .task {
            loadPeople()
        }
    }
}

#Preview {
    XMLView()
}
