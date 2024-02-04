//
//  SearchBarView.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import SwiftUI

extension MainView {
    
    var searchBar: some View {
        VStack(spacing: 300) {
            TextField("Type a word...", text: $searchWord)
                .foregroundColor(Color.primary)
                .font(.system(size: 32, weight: .regular, design: .rounded))
                .padding()
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
    }
}

