//
//  Expence_TrackerApp.swift
//  Expence Tracker
//
//  Created by Anthony Aniobi on 24/07/2023.
//

import SwiftUI

@main
struct Expence_TrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
