//
//  ContentView.swift
//  MAD_ALP
//
//  Created by Student on 21/05/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            // Calendar
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            // Add exercise
            AddExerciseView()
                .tabItem {
                    Label("Add Exercise", systemImage:
                        "plus.square.dashed")
                }//.badge("!")
        }
    }
}

#Preview {
    MainView()
}
