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
                .foregroundStyle(.gray.opacity(0.1))
                .frame(width: 137, height: 40)
            HStack {
                Image("UKSymbol")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 27, height: 27)
                
                Text("English")
                    .font(.system(size: 18, design: .rounded))
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
