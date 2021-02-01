//
//  Fact.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import Foundation

struct Fact : Codable, Identifiable {
    var id: String
    let categories : [String]
    let url : String
    let value : String
}
