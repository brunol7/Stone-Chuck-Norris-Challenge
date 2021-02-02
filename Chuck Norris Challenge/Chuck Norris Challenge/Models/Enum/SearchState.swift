//
//  SearchState.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 01/02/21.
//

import Foundation

/**
 SearchState is the enum to define in which state the app is, used in the @Published property `searchState` in `FactsListVieModel` that tells the `StateView` which messages should appear to the user.
 
 - Author : Bruno Luebke
 */
enum SearchState {
    
    /// The state in which the app starts.
    case zero
    
    /// The state when the app is searching.
    case searching
    
    /// The state when the search returns no facts
    case noResults
    
    /// The state when the search returns facts successfully
    case successfull
    
    /// The state when there's an request error
    case searchError
    
    /// The state when there's an network error
    case networkError
    
    /// The state when there's an decoding error
    case decodeError

}
