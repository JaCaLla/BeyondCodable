//
//  Person.swift
//  BeyondCodable
//
//  Created by Javier Calatrava on 10/3/25.
//

import Foundation

// El modelo 'Person' debe ser 'Codable' para poder trabajar con JSON.
struct Person: Identifiable, Codable {
    var name: String
    var age: Int
    
    var id: String { name }
}
