//
//  Chuck_Norris_ChallengeApp.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 27/01/21.
//

import SwiftUI

@main
struct Chuck_Norris_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: FactsListViewModel())
        }
    }
}
