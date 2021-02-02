//
//  FactsListViewModel.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import Foundation
import Combine

/**
 This is the main ViewModel class of this app, responsible for handling all the data that makes the app run.

 It's responsible for:
  The @Published variables **searchText**, **facts** and **searchState**
  The **searchFacts(query:)** function
 
 - Author : Bruno Luebke

 */
class FactsListViewModel : ObservableObject{
    
    /// Variable that emits observable events whenever the searchText is changed. Receives value from the searchBar input.
    @Published var searchText: String = ""

    /// Variable that emits observable events whenever the facts are loaded. Receives value from `searchFacts(query:)`
    @Published public private(set) var facts: [Fact] = []
    
    /// Variable that emits observable events whenever the state is changed. Receives value from `searchFacts(query:)`
    @Published var searchState : SearchState = .zero
    
    /// Set that stores the subscribers from `searchText` as AnyCancellable objects
    private var disposables = Set<AnyCancellable>()
    
    init(){
        // making `searchFacts(query:)` a subscriber of `searchText`
        $searchText
            .sink(receiveValue: searchFacts(query:))
            .store(in: &disposables)
    }
    
    /**
     Method responsible for fetching data from API, decoding the JSON response from the API to facts to be used on the app and setting the state of the app.
     
     - Parameter query : A string to retrieve facts. Value extracted from the SearchBar.
     */
    func searchFacts(query: String){
        /// Base URL to access the API search
        let baseUrl = "https://api.chucknorris.io/jokes/search?"
        
        /// Creating the complete URL from the base and the query
        var combinedUrl = URLComponents(string: baseUrl)
        let queryItem = URLQueryItem(name: "query", value: query)
        combinedUrl?.queryItems?.append(queryItem)
        
        // Checking if the search method was properly called so we won't have problems. If query is empty, the function ends here.
        if query != "" {
            
            // Checking if the `combinedUrl` is a valid URL
            guard let fullUrl = combinedUrl?.url else {
                
                // Alerting that there is a problem with the request. The URL is invalid.
                searchState = .searchError
                
                return
            }
            
            // If `combinedUrl` is valid the app state is changed to .searching
            searchState = .searching
                
            // Trying to retrieve data from the URL.
            URLSession.shared.dataTask(with: fullUrl){ data, response, error in
                guard let data = data, error == nil else {
                    
                    // If the URLSession didn't work, we alert that ther is a network problem.
                    self.searchState = .networkError
                    
                    return
                }
                
                // If the URLSession did retrieve data we then try to decode the received data.
                if let factsSearch = try? JSONDecoder().decode(FactsSearch.self, from: data){
                    DispatchQueue.main.async {
                        // Making shure that we are cleaning the facts from the struct
                        self.facts.removeAll()
                        // Passing the retrieved facts to the ViewModel @Published variable
                        self.facts = factsSearch.result
                        // Defining the final state from the search according to the total number of facts found
                        if factsSearch.total > 0 {
                            self.searchState = .successfull
                        } else if factsSearch.total == 0 {
                            self.searchState = .noResults
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        // Defining the error state in case the data can't be decoded to facts.
                        self.searchState = .decodeError
                    }
                }
                
            }.resume()
        }
    }
    
    deinit {
        self.facts.removeAll()
        self.disposables.removeAll()
    }
}
