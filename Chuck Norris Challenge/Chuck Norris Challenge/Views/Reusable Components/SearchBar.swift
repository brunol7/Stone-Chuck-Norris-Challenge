//
//  SearchBar.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import Foundation
import UIKit
import SwiftUI


/// Creating a UIViewRepresentable so we can use the UISearchBar from UIKit in SwiftUI scope, once there's still no native search bar
struct SearchBar: UIViewRepresentable {

    /// Instanciating the @Binding variable connected to the @Published one in `FactsListViewModel`
    @Binding var searchText: String
    
    /// Our SearchBar Coordinator, responsible for the delegate methods of the UISearchBar
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {

        /// Instanciating the @Binding variable connected to the @Published one in `FactsListViewModel`
        @Binding var searchText: String

        init(searchText: Binding<String>) {
            _searchText = searchText
        }

        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            // Checking if there's text in the searchBar to be passed on
            guard let searchBarText = searchBar.text else { return }
                // Updating the @Binding variable from `FactsListViewModel`
                searchText = searchBarText
                // End the editing session of the searchBar when the search button is clicked, and by so, dismiss the keyboard
                UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
        }
        
    }

    func makeCoordinator() -> SearchBar.SearchBarCoordinator {
        return SearchBarCoordinator(searchText: $searchText)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        // Set the UISearchBar to be returned and used by SwiftUI
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "Type here for facts"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
    }
}


