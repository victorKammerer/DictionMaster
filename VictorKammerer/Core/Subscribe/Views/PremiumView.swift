//
//  PremiumView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 03/02/24.
//

import SwiftUI

struct PremiumView: View {
    
    @StateObject var vm = SearchViewModel()
    @Binding var searchedWord: String
    
    @Binding var isVisible: Bool

    
    var body: some View {
        ZStack (alignment: .bottom) {
            Image("premiumPhoto")
                .ignoresSafeArea()
                .position(x: 196.5, y: 230)
            
            VStack() {
                logo
                promoText
                
                RectangleButtonView(buttonText: "SUBSCRIBE") {
                    DispatchQueue.main.async {
                        self.searchedWord = ""
                        isVisible = false
                    }
                }
            }
        }
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView(searchedWord: .constant(""), isVisible: .constant(true))
    }
}

extension PremiumView {
    
    private var promoText: some View {
        VStack {
            Text("\(Text("Subscribe now to get").foregroundStyle(Color.theme.black)) \(Text("unlimited").foregroundStyle(Color.theme.lightBlue)) \(Text("searches and full access to").foregroundStyle(Color.theme.black)) \(Text("all features").foregroundStyle(Color.theme.lightBlue)) ")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
            
            Text("**Try 7 Days Free**, then only **$19,99** per year. Cancel anytime.")
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

extension PremiumView {
    
    private var logo: some View {
        VStack() {
            Image("icon")
                .padding(-25)
                .shadow(radius: 8)
            Image("title")
                .padding(.init(top: -25, leading: 0, bottom: -30, trailing: -45))
        }
    }
}
