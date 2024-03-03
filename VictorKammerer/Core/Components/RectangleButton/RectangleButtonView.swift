//
//  SearchButtonView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import SwiftUI

struct RectangleButtonView: View {
    
    let buttonText: String
    let buttonColor: Color?
    let action: () -> Void
    
    var body: some View {
        Text(buttonText)
            .frame(width: 358, height: 64)
            .background(buttonColor ?? Color.theme.lightBlue)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .kerning(1.8)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    action()
                        
                }
            }
    }
}

struct RectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButtonView(buttonText: "BUTTON", buttonColor: Color.theme.lightBlue, action: {})
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
