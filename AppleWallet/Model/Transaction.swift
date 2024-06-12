//
//  Transaction.swift
//  AppleWallet
//
//  Created by German David Vertel Narvaez on 9/06/24.
//

import Foundation

struct Transaction: Identifiable{
    var id = UUID()
    var merchant: String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle"
}

var transactions = [
    Transaction(merchant: "Amazon", amount: 70, date: "03/05/24", icon: "basket"),
    Transaction(merchant: "Apple", amount: 65, date: "01/05/24", icon: "visionpro"),
    Transaction(merchant: "Exito", amount: 6, date: "01/05/24", icon: "bag"),
    Transaction(merchant: "Olimpica", amount: 35, date: "01/05/24", icon: "storefront.fill"),

]
