//
//  ContentView.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import SwiftUI

struct ContentView: View {
    
    let cars = ["Subaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRX", "Tesla Model 3Subaru WRXSubaru WRX",
                "Porsche 911Subaru WRX", "Renault Zoe", "DeLoreanSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRX", "Tesla Model 3",
                "Porsche 911", "Renault Zoe", "DeLorean", "Tesla Model 3",
                "Porsche 911", "Renault ZoeSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRXSubaru WRX", "DeLorean", "Tesla Model 3",
                "Porsche 911", "Renault Zoe", "DeLorean", "Tesla Model 3",
                "Porsche 911", "Renault Zoe", "DeLorean"]
    
    @State private var searchText : String = ""

    
    var body: some View {
        NavigationView {
            VStack() {
                SearchBar(text: $searchText)
                
                List {
                    ForEach(self.cars, id: \.self) { car in
                        VStack(alignment: .leading) {
                            let factText = Text(car)
                            if car.count <= 80 {
                                factText
                                    .font(.title2)
                            } else {
                                factText
                                    .font(.body)
                            }
                            HStack(alignment: .bottom) {
                                Text("category")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical,2)
                                    .background(Color("brandColor"))
                                    .foregroundColor(.white)
                                    .textCase(.uppercase)
                                    .font(.footnote)
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "square.and.arrow.up").foregroundColor(Color("brandColor"))
                                        .font(.title2)
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
        
            }
            .navigationBarTitle(Text("Chuck Norris Facts"))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

