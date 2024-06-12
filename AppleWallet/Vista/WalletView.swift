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
    //variables de estado para las animacines y tranciciones
    private static let cardTimingOffset: CGFloat = 0.4
    @State private var isCardPresented = false

    
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
                        .id(self.isCardPresented)
                        .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                        .animation(self.transitionAnimation(for: Card), value: self.isCardPresented)
                       
                }
            }
            .onAppear{
                self.isCardPresented.toggle()
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
    
    //funcin para la animacion, hace que las tajetas aparezcan de izquierda a derecha una detras de la otras en la zona de tarjetero
    private func transitionAnimation(for card: Card) -> Animation{
        var delay = 0.0
        if let index = index(for: card) {
            delay = Double(cards.count - index)*WalletView.cardTimingOffset
        }
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.1).delay(delay)
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
