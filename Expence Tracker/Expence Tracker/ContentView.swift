//
//  ContentView.swift
//  Expence Tracker
//
//  Created by Anthony Aniobi on 24/07/2023.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    let data = transactionListVM.accumulateTransactions()
                    if(!data.isEmpty){
                        let totalExpenses = data.last?.1 ?? 0
                        // MARK: line chart
                        CardView {
                            VStack (alignment:.leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")),type: .title)
                                LineChart()
                            }
                            .background(Color.systemBackground)
                                
                        }.data(data)
                            .chartStyle(ChartStyle(backgroundColor: .systemBackground, foregroundColor: ColorGradient(.icon.opacity(0.4), .icon)))
                            .frame(height: 300)
                    }
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group{
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
        
    }
}
