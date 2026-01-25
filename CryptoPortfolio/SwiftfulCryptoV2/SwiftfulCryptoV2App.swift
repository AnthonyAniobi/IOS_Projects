//
//  SwiftfulCryptoV2App.swift
//  SwiftfulCryptoV2
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import SwiftUI

@main
struct SwiftfulCryptoV2App: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
            }
            .environmentObject(HomeViewModel())
        }
    }
}
