//
//  PeopleListView.swift
//  BeyondCodable
//
//  Created by Javier Calatrava on 11/3/25.
//

import SwiftUI

struct PeopleListView: View {
    var people: [Person]
    var body: some View {
        VStack {
            ForEach(people) { person in
                HStack(alignment: .center) {
                    Text(person.name)
                        .font(.headline)
                    Text("Age: \(person.age)")
                        .font(.subheadline)
                }
            }
        }
    }
}
