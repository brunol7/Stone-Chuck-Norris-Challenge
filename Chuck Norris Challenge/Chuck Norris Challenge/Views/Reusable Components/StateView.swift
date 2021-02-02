//
//  StateView.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 01/02/21.
//

import Foundation
import SwiftUI

/**
 Created to pass the user a message off what's happening in the app. It responds to the enum `SearchState`, creating a image and message for each state in the enum.
 
 - Author : Bruno Luebke
 */
struct StateView : View {
    // The message and image variables
    private var image : Image?
    private var message : String = ""
    
    /// Instanciating the @Binding variable connected to the @Published one in `FactsListViewModel`
    @Binding var state : SearchState

    
    @ViewBuilder var body : some View {
        VStack {
            Spacer()
            image
                .accessibility(identifier: "stateImage")
            Text(message)
                .font(.title)
                .multilineTextAlignment(.center)
                .accessibility(identifier: "stateMessage")
            Spacer()
        }
        .padding()
        .foregroundColor(Color("brandColor"))
    }
    
    init(_ state: Binding<SearchState>) {
        self._state = state
        // Here we determine in the switch case, which message and image we'll use in each state
        switch self.state {
        case .zero :
            self.image = Image("chuckNorrisApproved")
            self.message = "Let's find some facts"
        case .searching :
            self.image = Image("chuckNorrisApproved")
            self.message = "Searching..."
        case .noResults :
            self.image = Image("chuckNorrisAngry")
            self.message = "0 facts encontered in your search"
        case .networkError :
            self.image = Image("chuckNorrisAngry")
            self.message = "There's a network problem"
        case .searchError :
            self.image = Image("chuckNorrisAngry")
            self.message = "There's something wrong in your request"
        case .decodeError:
            self.image = Image("chuckNorrisAngry")
            self.message = "I didn't understood what I'd found"
        case .successfull:
            print("Successfull search")
        }
}



}
