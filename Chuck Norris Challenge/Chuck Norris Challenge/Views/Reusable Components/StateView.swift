//
//  StateView.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 01/02/21.
//

import Foundation
import SwiftUI

struct StateView : View {
    var image : String
    var message : String
    var state : searchState {
        didSet{
            switch state {
            case .zero :
                self.image = "chuckNorrisApproved"
                self.message = ""
            case .noResults :
                self.image = "chuckNorrisAngry"
                self.message = "0 facts encontered in your search"
            case .networkError :
                self.image = "chuckNorrisAngry"
                self.message = "There's a network problem"
            case .searchError :
                self.image = "chuckNorrisAngry"
                self.message = "Your search returned an error"
            }
        }
    }
    var body : some View {
        VStack {
          Spacer()
          Image(image)
          Text(message)
            .font(.title)
          Spacer()
        }
        .padding()
        .foregroundColor(Color(.systemIndigo))
    }
}

enum searchState {
    case zero
    case noResults
    case networkError
    case searchError
}
