//
//  Fact.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import Foundation

///This is the struct that receive the fact fetched from the API
/// - Author : Bruno Luebke
struct Fact : Codable, Identifiable {
    /// The id from the Fact. Provided by the API.
    var id: String
    
    /// The category from the Fact. Provided by the API.
    let categories : [String]
    
    /// The url to acess the Fact. Provided by the API.
    let url : String
    
    /// The Fact itself, the frases that give meaning to this app. Provided by the API.
    let value : String
    
}
