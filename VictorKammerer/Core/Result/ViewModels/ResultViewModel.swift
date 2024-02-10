//
//  ResultViewModel.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import Foundation

import AVFoundation

class ResultViewModel: ObservableObject {
    private var audioPlayer: AVPlayer?
    private var word: Word?

    init(word: Word) {
        self.word = word
    }

    func playAudio() {
        guard word != nil else {
            return
        }

        guard let audioString = phoneticAudio() else {
            return
        }

        guard let audioURL = URL(string: audioString) else {
            return
        }

        audioPlayer = AVPlayer(url: audioURL)
        audioPlayer?.play()
    }
    
    func phoneticText() -> String? {
        guard let word = word else {
            return nil
        }
        
        for phonetic in word.phonetics {
            if let text = phonetic.text, !text.isEmpty {
                return phonetic.text
            }
        }
        return nil
    }

    private func phoneticAudio() -> String? {
        guard let word = word else {
            return nil
        }

        for phonetic in word.phonetics {
            if !phonetic.audio.isEmpty {
                return phonetic.audio
            }
        }
        return nil
    }
}
