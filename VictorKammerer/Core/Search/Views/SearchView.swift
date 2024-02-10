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

    var body: some View {
        NavigationStack{
            VStack {
                LanguageSelectorView()
                    .padding()
                Spacer()
                searchBar
                Spacer()
                
                NavigationLink(destination: vm.word.map { ResultView(word: $0, searchedWord: $vm.searchedWord) }.navigationBarBackButtonHidden(true) , isActive: $vm.resultAppearing) {
                    EmptyView()
                }
                .hidden()
                                
                NavigationLink(destination: PremiumView().navigationBarBackButtonHidden(true), isActive: $vm.subscribeAppearing) {
                    EmptyView()
                }
                .hidden()
                
                if vm.buttonAppearing {
                    RectangleButtonView(buttonText: "SEARCH") {
                        vm.searchWord()
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
                .toolbar(.hidden)
        }
    }
}
