//
//  MAD_ALPApp.swift
//  MAD_ALP
//
//  Created by Student on 21/05/25.
//

import SwiftUI
import SwiftData

@main
struct MAD_ALPApp: App {
    @StateObject private var exerciseViewModel = ExerciseViewModel()
    @StateObject private var scheduleViewModel = ScheduleViewModel()
    @StateObject private var templateViewModel = TemplateViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [Schedule.self, Exercise.self])
                .environmentObject(exerciseViewModel)
                .environmentObject(scheduleViewModel)
                .environmentObject(templateViewModel)
        }
    }
}
