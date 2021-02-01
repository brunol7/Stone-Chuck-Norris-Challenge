//
//  FactsListViewModel.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import Foundation
import Combine

class FactsListViewModel : ObservableObject{
    
    @Published var searchText: String = ""

    @Published public private(set) var facts: [Fact] = []
    
    private var disposables = Set<AnyCancellable>()
    
    init(){
        $searchText
            .sink(receiveValue: searchFacts(query:))
            .store(in: &disposables)
    }
    
    func searchFacts(query: String){
        let baseUrl = "https://api.chucknorris.io/jokes/search?query="
        
        guard let fullUrl = URL(string: baseUrl + query) else { return }
        
            URLSession.shared.dataTask(with: fullUrl){ data, response, error in
            
                guard let data = data, error == nil else { return }
                
                    if let factsSearch = try? JSONDecoder().decode(FactsSearch.self, from: data){
                        DispatchQueue.main.async {
                            self.facts = factsSearch.result
                        }
                    }
            
        }.resume()
    }
}
