//
//  SearchBarView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import SwiftUI

extension SearchView {
    
    var searchBar: some View {
        
        VStack(spacing: 300) {
            TextField(
                "",
                text: $vm.searchedWord,
                prompt: Text("Type a word...")
                    .font(.system(size: 32, weight: .regular, design: .rounded))
                
            )
            .foregroundColor(Color.primary)
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .padding()
            .focused($isSearchFieldFocused)
            .frame(alignment: .center)
            .multilineTextAlignment(.center)
            .onChange(of: vm.searchedWord) { _ in
                vm.buttonAppears()
            }
            .onAppear {
                isSearchFieldFocused = true
            }
        }
    }
}

