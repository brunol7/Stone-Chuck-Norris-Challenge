//
//  ContentView.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: FactsListViewModel
    
    let cars = ["Subaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRX", "Tesla Model 3Subaru WRXSubaru WRX",
                "Porsche 911Subaru WRX", "Renault Zoe", "DeLoreanSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRX", "Tesla Model 3",
                "Porsche 911", "Renault Zoe", "DeLorean", "Tesla Model 3",
                "Porsche 911", "Renault ZoeSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRX", "DeLorean", "Tesla Model 3",
                "Porsche 911", "Renault Zoe", "DeLorean", "Tesla Model 3",
                "Porsche 911", "Renault Zoe", "DeLorean"]
    
//    @State private var searchText : String = ""
    @State private var searchTerm: String = ""


    
    var body: some View {
        NavigationView {
            VStack() {
                SearchBar(searchTerm: $viewModel.searchText)
                
                List (self.viewModel.facts) { fact in
                        FactItem(fact: fact)

                }
                .listStyle(PlainListStyle())
                .buttonStyle(PlainButtonStyle())
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

