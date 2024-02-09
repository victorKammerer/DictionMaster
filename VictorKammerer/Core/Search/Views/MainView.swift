//
//  ContentView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 03/02/24.
//

import SwiftUI
import SwiftData

struct MainView: View {

    //@StateObject private var vm = WordViewModel()
    @State var searchWord: String = ""
    
    var body: some View {
        ZStack{
            VStack {
                LanguageSelectorView()
                    .padding()
                Spacer()
                searchBar
                Spacer()
                RectangleButtonView(buttonText: "SEARCH") {
                    print(searchWord)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
                .toolbar(.hidden)
        }
    }
}
