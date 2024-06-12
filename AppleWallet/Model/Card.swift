//
//  Card.swift
//  AppleWallet
//
//  Created by German David Vertel Narvaez on 9/06/24.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var name: String
    var type: CardType
    var number: String
    var expirationDate: String
    var image: String {
        return type.rawValue
    }
}

enum CardType: String{
    case visa
    case mastercard
    case amex
    case chase
    case discover
}

var cards = [
    Card(name: "German David Vertel", type: .visa, number: "1234 5896 4582 4587", expirationDate: "09/26"),
    Card(name: "Juan manuel lopez", type: .amex, number: "1234 5896 4582 4587", expirationDate: "02/26"),
    Card(name: "German David Vertel", type: .mastercard, number: "1234 5896 4582 4587", expirationDate: "07/25"),
    Card(name: "German David Vertel", type: .chase, number: "1234 5896 4582 4587", expirationDate: "07/26"),
    Card(name: "German David Vertel", type: .discover, number: "1234 5896 4582 4587", expirationDate: "08/28"),
]
