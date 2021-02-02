//
//  ContentView.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import SwiftUI

struct ContentView: View {
    
    /// Instanciating our ViewModel Class
    @ObservedObject var viewModel: FactsListViewModel

    
    @ViewBuilder var body: some View {
        NavigationView {
            VStack() {
                
                SearchBar(searchText: $viewModel.searchText)
                    .accessibility(identifier: "searchBar")

                // Checking the app state so we can or instatiate the list of facts or the `StateView`
                if viewModel.searchState == .successfull {
                    List (self.viewModel.facts) { fact in
                            FactItem(fact: fact)
                    }
                    .listStyle(PlainListStyle())
                    .buttonStyle(PlainButtonStyle())
                    .accessibility(identifier: "factsList")
                } else {
                    StateView($viewModel.searchState)
                }
                
            }
            .navigationBarTitle(Text("Chuck Norris Facts"))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: FactsListViewModel())
            
    }
}

