//
//  SearchButtonView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import SwiftUI

struct RectangleButtonView: View {
    
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Text(buttonText)
            .frame(width: 358, height: 64)
            .background(Color.theme.lightBlue)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .onTapGesture {
                action()
            }
    }
}

struct RectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButtonView(buttonText: "BUTTON", action: {})
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
