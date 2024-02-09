//
//  PreviewProvider.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 08/02/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let resultVM = ResultViewModel()
    
    let word = Word(
        word: "Hello",
        phonetics: [Phonetic(text: "həˈləʊ", audio: "//ssl.gstatic.com/dictionary/static/sounds/20200429/hello--_gb_1.mp3")],
        origin: "early 19th century: variant of earlier hollo ; related to holla.",
        meanings: [Meaning(partOfSpeech: "exclamation",
                           definitions: [Definition(definition: "used as a greeting or to begin a phone conversation.", example: "hello there, Katie! ")])]
        )
}
