//
//  WordView.swift
//  VictorKammerer
//
//  Created by Wilma Ferreira on 04/02/24.
//

import SwiftUI
import AVKit

struct WordView: View {
    
    let word: Word
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 13){
                Text(word.word)
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                
                ForEach(word.phonetics, id: \.self) { phonetic in
                    HStack {
                        AudioButtonView()
                            .onTapGesture {
                                playAudio(audioURL: phonetic.audio)
                            }
                        Text("/,\(phonetic.text)/")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundStyle(.black.opacity(0.4))
                    }
                }
                ForEach(word.meanings, id: \.self) { meaning in
                    ForEach(meaning.definitions, id: \.self) { definition in
                        Text("\(Text("1)").foregroundStyle(.black)) \(Text("[\(meaning.partOfSpeech)]").foregroundStyle(.black.opacity(0.4))) \(Text(definition.definition).foregroundStyle(.black)) ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundStyle(.black.opacity(0.4))
                        Text("• \(definition.example)")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundStyle(.black)
                    }
                }
                Spacer()
            }.padding()
            Spacer()
        }
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: dev.word)
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
