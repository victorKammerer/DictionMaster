//
//  ContentView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 03/02/24.
//

import SwiftUI
import SwiftData


struct SearchView: View {
    
    @StateObject var vm = SearchViewModel()
    
    @State private var isSearchPresented = true
    @State private var isResultPresented = false
    @State private var isPremiumPresented = false
    
    @State private var isFSPresented = false
    
    @Environment(\.dismiss) private var dismiss
    @FocusState var isSearchFieldFocused: Bool
    
    var body: some View {
        VStack {
            LanguageSelectorView()
                .padding()
            Spacer()
            searchBar
            Spacer()
            
            if vm.buttonAppearing {
                RectangleButtonView(buttonText: "SEARCH") {
                    vm.searchWord()
                    isFSPresented = true
                }.padding()
            }
        }.fullScreenCover(isPresented: $isFSPresented) {
            Group {
              if isResultPresented {
                  vm.word.map { ResultView(word: $0, searchedWord: $vm.searchedWord, isVisible: $isResultPresented)
                  }
                  .onDisappear {
                    isFSPresented = false
                  }
              } else if isPremiumPresented {
                  PremiumView(searchedWord: $vm.searchedWord, isVisible: $isPremiumPresented)
                      .onDisappear {
                        isFSPresented = false
                      }
              }
            }
            .onAppear {
                if vm.resultAppearing {
                    isResultPresented = true
                } else {
                    isPremiumPresented = true
                }
            }
          }
        .transaction({ transaction in
            
            transaction.disablesAnimations = true
            
            transaction.animation = .easeInOut(duration: 0.2)
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchView()
        }
    }
}
