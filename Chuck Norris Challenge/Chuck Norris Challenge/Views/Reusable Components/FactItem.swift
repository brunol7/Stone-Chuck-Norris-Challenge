//
//  FactView.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 01/02/21.
//

import Foundation
import SwiftUI

/// The default representation for the Itens in the Facts List. Used by `ContentView` whe instantiating the List
struct FactItem : View {
    var  fact : Fact
    @State private var isSharePresented: Bool = false
    @ViewBuilder var body : some View {
        VStack(alignment: .leading) {
            /// Created the factText instance so we can further set it with different fonts according to each case
            let factText = Text(fact.value)
            //checking the number of char in the fact text, so we can define the appropriated font
            if fact.value.count <= 80 {
                factText
                    .font(.title2)
            } else {
                factText
                    .font(.body)
            }
            HStack(alignment: .bottom) {
                // Checking if there is an categorie assigned to the fact, if not, will be assigned UNCATEGORIZED instead.
                if fact.categories.isEmpty{
                    Text("uncategorized")
                        .padding(.horizontal, 10)
                        .padding(.vertical,2)
                        .background(Color("brandColor"))
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                        .font(.footnote)
                } else {
                    Text(fact.categories.joined(separator: ", "))
                        .padding(.horizontal, 10)
                        .padding(.vertical,2)
                        .background(Color("brandColor"))
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                        .font(.footnote)
                }
                Spacer()
                // Here is instanciated the button and it's action that calls for the `ActivityViewController` to share the fact
                Button(action: {
                    isSharePresented = true
                }) {
                    Image(systemName: "square.and.arrow.up").foregroundColor(Color("brandColor"))
                        .font(.title)
                }
                .sheet(isPresented: $isSharePresented, content: {
                    if let shareUrl = URL(string: fact.url){
                        ActivityViewController(activityItems: [shareUrl])
                    }
                })
            }
        }
    }
    
    
}
