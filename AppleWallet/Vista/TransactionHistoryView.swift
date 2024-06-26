//
//  TransactionHistoryView.swift
//  AppleWallet
//
//  Created by German David Vertel Narvaez on 9/06/24.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    var currentTransactions: [Transaction]
    
    var body: some View {
        VStack{
            Text("Historial de transacciones")
                .font(.system(size: 22, weight: .black, design: .rounded))
                .foregroundStyle(.teal)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 22){
                    ForEach(self.currentTransactions) { transaction in
                        TransactionView(transaction: transaction)
                    }
                }
                .padding()
            }
        }
    }
}


struct TransactionView: View {
    var transaction: Transaction
    
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.teal)
            .overlay(
                VStack{
                    Spacer()
                    
                    Image(systemName: transaction.icon)
                        .font(.system(size: 48))
                    Text(transaction.merchant)
                        .font(.system(.title3, design: .rounded))
                    
                    Text("\(String(format: "%.2f", transaction.amount))$")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .padding(8)
                    
                    Text(transaction.date)
                        .font(.system(.caption, design: .rounded))
                    Spacer()
                }.foregroundStyle(.white)

            )
            .frame(width: 200, height: 200)
    }
}


#Preview ("Historial de transacciones"){
    TransactionHistoryView(currentTransactions: transactions)
    
}
