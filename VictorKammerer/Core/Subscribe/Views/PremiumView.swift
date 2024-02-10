//
//  PremiumView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 03/02/24.
//

import SwiftUI

struct PremiumView: View {
    
    @StateObject var vm = SearchViewModel()
    @State private var subscribedView: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack (alignment: .bottom) {
            //background
            Image("premiumPhoto")
                .ignoresSafeArea()
                .position(x: 196.5, y: 230)
            
            VStack() {
                logo
                promoText
                
                RectangleButtonView(buttonText: "SUBSCRIBE") {
                    vm.searchedWord = ""
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView()
    }
}

extension PremiumView {
    
    private var promoText: some View {
        VStack {
            Text("\(Text("Subscribe now to get").foregroundStyle(.black)) \(Text("unlimited").foregroundStyle(Color("lightBlue"))) \(Text("searches and full access to").foregroundStyle(.black)) \(Text("all features").foregroundStyle(Color("lightBlue"))) ")
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
            Image("title")
                .padding(.init(top: -25, leading: 0, bottom: -30, trailing: -30))
        }
    }
}
