//
//  WordView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 03/02/24.
//

import SwiftUI
import AVKit

struct ResultView: View {
    let searchWord: Word
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Search results for: \(searchWord)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
//                WordView(word: )
//                    .padding()
            }
        }
    }
}

private func playAudio(audioURL: String) {
    guard let url = URL(string: "https:" + audioURL) else {
        return
    }
    
    let playerItem = AVPlayerItem(url: url)
    let player = AVPlayer(playerItem: playerItem)
    
    player.volume = 1.0 // Adjust volume as needed
    
    // Play the audio
    player.play()
}
