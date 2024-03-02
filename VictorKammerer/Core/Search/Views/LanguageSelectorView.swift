//
//  SearchButtonView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import SwiftUI

struct LanguageSelectorView: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .foregroundStyle(Color.theme
                    .gray.opacity(0.1))
                .frame(width: 137, height: 40)
            HStack {
                Image("UKSymbol")
                    .frame(width: 26, height: 27)
                
                
                Text("English")
                    .textCase(.uppercase)
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .kerning(1.8)
                    
            }
        }
    }
}

struct LanguageSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectorView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
