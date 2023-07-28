//
//  TransactionListViewModel.swift
//  Expence Tracker
//
//  Created by Anthony Aniobi on 24/07/2023.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject{
    @Published var transactions: [Transaction] = []
    
    init(){
        getTransactions()
    }
    
    func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else{
            print("invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, httpResponse, error in
            guard let data = data, error == nil else {
                print("failed url session")
                return
            }
            // convert to json
            
            do{
                let transactions = try JSONDecoder().decode([Transaction].self, from: data)
                dump(transactions)
                DispatchQueue.main.async {
                    self.transactions = transactions
                }
            }
            catch{
                print("failed")
                print(error)
            }
            
        }
        
        task.resume()

    }
    
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else{ return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum{
        print("accumulateTransactions")
        guard !transactions.isEmpty else{return[]}
        let today = "02/17/2022".dateParsed()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval",dateInterval)
         
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60*60*24) {
            let dailyExpenses = transactions.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(0, { $0 - $1.signedAmount});
            
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            cumulativeSum.append((date.formatted(), sum))
        }
        return cumulativeSum
    }
}
