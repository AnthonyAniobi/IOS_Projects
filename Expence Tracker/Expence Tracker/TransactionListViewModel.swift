//
//  TransactionListViewModel.swift
//  Expence Tracker
//
//  Created by Anthony Aniobi on 24/07/2023.
//

import Foundation


final class TransactionListViewModel: ObservableObject{
    @Published var transactoins: [Transaction] = []
    
    func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else{
            print("invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response)-> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200 else{
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder )
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print("Error")
                }
            } receiveValue: { <#[Transaction]#> in
                <#code#>
            }

    }
}
