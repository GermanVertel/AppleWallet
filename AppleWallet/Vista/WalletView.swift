//
//  ContentView.swift
//  AppleWallet
//
//  Created by German David Vertel Narvaez on 8/06/24.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        VStack {
           TopBar()
        }
        .padding()
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
