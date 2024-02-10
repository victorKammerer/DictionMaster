//
//  AudioButtonView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import SwiftUI

struct AudioButtonView: View {
    var body: some View {
        Image(systemName: "speaker.wave.2")
            .font(.headline)
            .foregroundStyle(.white)
            .frame(width: 46, height: 46)
            .background(
                Circle()
                    .foregroundStyle(.lightBlue)
            )
    }
}

struct AudioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AudioButtonView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
