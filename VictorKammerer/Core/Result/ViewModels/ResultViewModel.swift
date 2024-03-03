//
//  ResultViewModel.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import Foundation
import SwiftUI
import AVFoundation

class ResultViewModel: ObservableObject {
    private var audioPlayer: AVPlayer?
    var word: Word?
    
    init(word: Word) {
        self.word = word
    }
    
    func playAudio(completion: @escaping () -> Void) {
        
        guard word != nil else {
            return
        }
        
        guard let audioString = phoneticAudio() else {
            return
        }
        
        guard let audioURL = URL(string: audioString) else {
            return
        }
        
        let playerItem = AVPlayerItem(url: audioURL)
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                               object: playerItem,
                                               queue: .main) {  _ in
            completion()
        }
        
        audioPlayer = AVPlayer(playerItem: playerItem)
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
    
    func phoneticAudio() -> String? {
        
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
    
    func updateWord(_ newWord: Word) {
    }
    
    func clear() {
        self.word = nil
    }
}
