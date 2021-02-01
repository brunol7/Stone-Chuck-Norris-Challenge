//
//  FactView.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 01/02/21.
//

import Foundation
import SwiftUI

struct FactItem : View {
    public let fact : Fact
    var body : some View {
        VStack(alignment: .leading) {
            let factText = Text(fact.value)
            if fact.value.count <= 80 {
                factText
                    .font(.title2)
            } else {
                factText
                    .font(.body)
            }
            HStack(alignment: .bottom) {
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
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up").foregroundColor(Color("brandColor"))
                        .font(.title2)
                }
            }
        }
    }
}
