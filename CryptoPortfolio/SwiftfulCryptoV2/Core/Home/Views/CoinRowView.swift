//
//  CoinRowView.swift
//  SwiftfulCryptoV2
//
//  Created by Anthony Aniobi on 24/01/2026.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumns: Bool
    
    var body: some View {
        HStack(spacing: 0){
            
            leftColumn
            
            Spacer()
            
            if showHoldingsColumns {
                centerColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumns: true)
}


extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2DecimalPlaces())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    
    private var rightColumn: some View {
        VStack (alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6DecimalPlaces())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >=  0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
