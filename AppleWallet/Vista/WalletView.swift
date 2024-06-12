//
//  ContentView.swift
//  AppleWallet
//
//  Created by German David Vertel Narvaez on 8/06/24.
//

import SwiftUI

struct WalletView: View {
    //constante para offsett:  desparramar las tarjetas una debajo de otra
    private static let cardOffset: CGFloat = 40.0
    
    var body: some View {
        VStack {
           TopBar()
            Spacer()
            
            ZStack{
                ForEach(cards){Card in
                        CardView(card: Card)
                        .padding(.horizontal, 24)
                        .offset(self.offset(for: Card))
                        .zIndex(self.zIndex(for: Card))
                }
            }
            Spacer()
        }
        .padding()
    }
    
    
    // una vez tenemos el indice de ubiccion de la taejeta en el array con la funcion index de abajo, esta funcion zindex se encarga de girarlo, de calcular el opuesto de donde se encuenta, entonces posteriormente se enchufa a la cardview despues del .padding
    private func zIndex(for card: Card) -> Double {
        guard let index = index(for: card) else {
            return 0
        }
        return -Double(index)
    }
    
    
    //funcion para calucalr cuanto hay que calcular el CGZize de cuanto hay que desplazar verticalmente para separar las tarjetas una debajo de otra, esto se coloca justo antes del zindex
    
    private func offset(for card: Card) -> CGSize {
        guard let index = index(for: card) else {
            return CGSize()
        }
        return CGSize(width: 0, height: -WalletView.cardOffset*CGFloat(index))
    }
    
    
    
    //esta funcion esta diseñada para obtener la informacion de donde se encuenta una tarjeta en concreto del array
    
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: {$0.id == card.id}) else {
            return nil
        }
        return index
    }
}

struct TopBar: View {
    var body: some View {
        
        HStack {
            Text("Cartera")
                .font(.system(.title, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Image(systemName: "plus.circle.fill")
        }
        .padding(.horizontal, 24)
        .padding(.top,24)
    }
}

#Preview {
    WalletView()
}
