//
//  FactsSearch.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 01/02/21.
//

import Foundation

/// This is the struct that receive directly the data provided by the API.
/// - Author : Bruno Luebke
struct FactsSearch : Codable {
    /// The total amount of facts retrieved.
    let total : Int
    
    /// The array storing all the facts retrieved.
    let result : [Fact]
}
