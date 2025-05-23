//
//  MAD_ALPApp.swift
//  MAD_ALP
//
//  Created by Student on 21/05/25.
//

import SwiftUI

@main
struct MAD_ALPApp: App {
    @StateObject private var exerciseViewModel = ExerciseViewModel()
    @StateObject private var scheduleViewModel = ScheduleViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(exerciseViewModel)
                .environmentObject(scheduleViewModel)
        }
    }
}
