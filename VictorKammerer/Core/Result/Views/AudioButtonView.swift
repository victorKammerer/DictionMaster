//
//  AudioButtonView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import SwiftUI

struct AudioButtonView: View {
    
    @Binding var isLoading: Bool
    @Binding var isNil: Bool

    var body: some View {
        if isNil {
            Image(systemName: "speaker.slash.fill")
                .font(.system(size: 24))
                .foregroundColor(.white)
                .frame(width: 46, height: 46)
                .background(
                    Circle()
                        .foregroundStyle(Color.gray)
                )
            
        } else {
            if isLoading {
                ProgressView()
                    .scaleEffect(1.3, anchor: .center)
                    .tint(.white)
                    .font(.headline)
                    .frame(width: 46, height: 46)
                    .foregroundStyle(.white)
                    .background(
                        Circle()
                            .foregroundStyle(Color.theme.lightBlue)
                    )
            } else {
                Image("audio-speaker-on")
                    .font(.headline)
                    .frame(width: 46, height: 46)
                    .background(
                        Circle()
                            .foregroundStyle(Color.theme.lightBlue)
                    )
            }
        }
    }
}

struct AudioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AudioButtonView(isLoading: .constant(false), isNil: .constant(true))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
