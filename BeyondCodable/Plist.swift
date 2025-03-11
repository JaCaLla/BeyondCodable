//
//  Plist.swift
//  BeyondCodable
//
//  Created by Javier Calatrava on 11/3/25.
//

import SwiftUI

struct Plist: View {
    @State private var people: [Person] = []

    func loadPeople() {
        let plist = """
           <?xml version="1.0" encoding="UTF-8"?>
           <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
           <plist version="1.0">
               <array>
                   <dict>
                       <key>name</key>
                       <string>Juan Pérez</string>
                       <key>age</key>
                       <integer>30</integer>
                   </dict>
                   <dict>
                       <key>name</key>
                       <string>Ana Gómez</string>
                       <key>age</key>
                       <integer>25</integer>
                   </dict>
                   <dict>
                       <key>name</key>
                       <string>Sílvia</string>
                       <key>age</key>
                       <integer>55</integer>
                   </dict>
               </array>
           </plist>
           """

        let data = Data(plist.utf8)

        do {
            let decodedPeople = try PropertyListDecoder().decode([Person].self, from: data)
            self.people = decodedPeople
        } catch {
            print("\(error)")
        }

    }

    var body: some View {
        NavigationView {
            PeopleListView(people: people)
                .navigationTitle("Persons List (Plist)")
        }
            .task {
            loadPeople()
        }
    }
}

#Preview {
    Plist()
}
