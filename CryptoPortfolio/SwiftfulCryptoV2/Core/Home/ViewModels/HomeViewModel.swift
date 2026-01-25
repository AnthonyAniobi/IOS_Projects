//
//  HomeViewModel.swift
//  SwiftfulCryptoV2
//
//  Created by Anthony Aniobi on 24/01/2026.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
    
    
    
}
