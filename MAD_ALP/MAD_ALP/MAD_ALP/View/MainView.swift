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
            // Weekly Streak? (Main View)
            
            
            // Add exercise
            AddExerciseView()
                .tabItem {
                    Label("Add Exercise", systemImage:
                        "plus")
                }//.badge("!")
        }
    }
}

#Preview {
    MainView()
}
