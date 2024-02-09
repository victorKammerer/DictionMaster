//
//  VictorKammererApp.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 03/02/24.
//

import SwiftUI
import SwiftData

@main
struct VictorKammererApp: App {
        
    @StateObject private var vm = ResultViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
                    .toolbar(.hidden)
                
            }
            .environmentObject(vm)
        }
    }
}
