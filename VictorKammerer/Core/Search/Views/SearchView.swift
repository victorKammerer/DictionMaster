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
    
    @State private var isResultPresented = false
    @State private var isPremiumPresented = false
    @State private var isFSPresented = false
    
    @State var buttonString: String = "SEARCH"
    @State var buttonColor: Color = Color.theme.lightBlue
    
    @FocusState var isSearchFieldFocused: Bool
    
    var body: some View {
        ZStack {
            Color(Color.background)
                .ignoresSafeArea()
                
            VStack {
                LanguageSelectorView()
                    .padding()
                Spacer()
                searchBar
                Spacer()
                
                if vm.buttonAppearing {
                    
                    RectangleButtonView(buttonText: buttonString, buttonColor: buttonColor) {
                        withAnimation {
                            buttonString = "LOADING..."
                        }
                        
                        vm.searchWord()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            if vm.isWrongEntry {
                                buttonString = "INVALID ENTRY"
                                buttonColor = Color.red
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    vm.searchedWord = ""
                                    
                                    buttonColor = Color.lightBlue
                                    buttonString = "SEARCH"
                                }
                            }
                        }
                    }.padding()
                }
            }.fullScreenCover(isPresented: $vm.fullScreenAppearing) {
                Group {
                    if isResultPresented {
                        vm.word.map { ResultView(word: $0, searchedWord: $vm.searchedWord, isVisible: $isResultPresented)
                        }
                        .onDisappear {
                            buttonString = "SEARCH"
                            vm.fullScreenAppearing = false
                            vm.isWrongEntry = false
                            
                        }
                    } else if isPremiumPresented {
                        PremiumView(searchedWord: $vm.searchedWord, isVisible: $isPremiumPresented)
                            .onDisappear {
                                buttonString = "SEARCH"
                                vm.fullScreenAppearing = false
                                
                                vm.isWrongEntry = false
                            }
                    }
                }.onAppear {
                    if vm.resultAppearing {
                        isResultPresented = true
                    
                    } else if vm.subscribeAppearing {
                        isPremiumPresented = true
                    }
                    
                }
            }
        .transaction({ transaction in
                
                transaction.disablesAnimations = true
                
                    transaction.animation = .easeInOut(duration: 0.3)
            })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchView()
        }
    }
}
