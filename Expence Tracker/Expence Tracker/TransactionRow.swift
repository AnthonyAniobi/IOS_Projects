//
//  TransactionRow.swift
//  Expence Tracker
//
//  Created by Anthony Aniobi on 24/07/2023.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    var body: some View {
        HStack(spacing: 20){
            VStack(alignment: .leading, spacing: 6) {
                // MARK: Transaction merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction cateogry
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transaction date
                Text(transaction.date)
            }
        }
        .padding([.top, .bottom], 8)
            
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData)
//        TransactionRow(transaction: transactionPreviewData)
//            .preferredColorScheme(.dark)
    }
}
