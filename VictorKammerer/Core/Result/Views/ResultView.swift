//
//  WordView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 03/02/24.
//

import SwiftUI
import AVKit

struct ResultView: View {
    
    @EnvironmentObject private var vm: ResultViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                WordView(word: vm.searchedWord)
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultView()
                .toolbar(.hidden)
        }
        .environmentObject(dev.resultVM)
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
