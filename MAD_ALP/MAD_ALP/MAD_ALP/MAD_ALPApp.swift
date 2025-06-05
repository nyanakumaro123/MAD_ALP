//
//  MAD_ALPApp.swift
//  MAD_ALP
//
//  Created by Student on 21/05/25.
//

import SwiftUI
import SwiftData
import UserNotifications

@main
struct MAD_ALPApp: App {
    @StateObject private var exerciseViewModel = ExerciseViewModel()
    @StateObject private var scheduleViewModel = ScheduleViewModel()
    
    init() {
        requestNotificationPermission()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [Schedule.self, Exercise.self])
                .environmentObject(exerciseViewModel)
                .environmentObject(scheduleViewModel)
        }
    }

    func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if let error = error {
            print("Notification permission error: \(error)")
            }
        print("Notification permission granted: \(granted)")
        }
    }

    func scheduleExerciseNotification(title: String, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Upcoming Exercise"
        content.body = "You have \"\(title)\" scheduled in 15 minutes!"
        content.sound = .default

        // 15 minutes before the scheduled date
        let triggerDate = Calendar.current.date(byAdding: .minute, value: -15, to: date) ?? date
        let triggerComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerComponents, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error)")
            }
        }

        print("Scheduling notification for \(triggerDate)")
    }
}


