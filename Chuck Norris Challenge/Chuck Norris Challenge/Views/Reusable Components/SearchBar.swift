//
//  SearchBar.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import Foundation
import UIKit
import SwiftUI

struct SearchBar: UIViewRepresentable {

    @Binding var searchTerm: String
    

    class SearchBarCoordinator: NSObject, UISearchBarDelegate {

        @Binding var searchTerm: String

        init(searchTerm: Binding<String>) {
            self._searchTerm = searchTerm
        }

//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            searchTerm = searchText
//        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          searchTerm = searchBar.text ?? ""
          UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
        }
        
    }

    func makeCoordinator() -> SearchBar.SearchBarCoordinator {
        return SearchBarCoordinator(searchTerm: $searchTerm)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "teste"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = searchTerm
    }
}


