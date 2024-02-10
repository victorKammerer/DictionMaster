//
//  WordView.swift
//  VictorKammerer
//
//  Created by Wilma Ferreira on 04/02/24.
//

import SwiftUI
import AVKit

struct ResultView: View {
    
    let word: Word
    @StateObject private var vm: ResultViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var searchedWord: String
    
    init(word: Word, searchedWord: Binding<String>) {
        self.word = word
        self._searchedWord = searchedWord
        self._vm = StateObject(wrappedValue: ResultViewModel(word: word))
    }
    
    var body: some View {
        VStack {
            ScrollView{
                HStack {
                    resultHeader
                    Spacer()
                }
                resultContent
            }.padding(.top, 10)
            Spacer(minLength: 50)
            
            resultBottom
            
        }
        .padding(.horizontal, 20)
        Spacer()
    }
}

#Preview {
    let genericWord = Word(word: "", phonetics: [Phonetic(text: "oi", audio: "oi")], meanings: [Meaning(partOfSpeech: "oi", definitions: [Definition(definition: "blabkjijojojoblabla", example: "blabaknknnolbala")])])
    return ResultView(word: genericWord, searchedWord: .constant(""))
}

extension ResultView {
    
    var resultHeader: some View {
        VStack (alignment: .leading, spacing: 13) {
            Text(word.word)
                .font(.system(size: 45, weight: .bold, design: .rounded))
                .foregroundStyle(Color.black)
            HStack {
                AudioButtonView()
                
                Text(vm.phoneticText() ?? "")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.4))
            }
        }
    }
    
    var resultContent: some View {
        VStack() {
            ForEach(word.meanings.indices, id: \.self) { index in
                let meaning = word.meanings[index]
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        if let initialDef = meaning.definitions.first {
                            Text("\(index + 1)) ")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                            + Text("[\(meaning.partOfSpeech)] ")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundColor(.black.opacity(0.5))
                            + Text("\(initialDef.definition)")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    
                    ForEach(meaning.definitions.dropFirst(), id: \.self) { definition in
                        Text("• \(definition.definition)")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    var resultBottom: some View {
        VStack {
            Divider()
            HStack {
                Text("That’s it for “\(word.word)”!")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.top, 20)
            
            HStack {
                Text("Try another search now!")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.top, 1)
            RectangleButtonView(buttonText: "NEW SEARCH") {
                DispatchQueue.main.async {
                    self.searchedWord = ""
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
