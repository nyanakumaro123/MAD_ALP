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
    @StateObject private var templateViewModel = TemplateViewModel()
    
    let container: ModelContainer
    
    init() {
        // Configure SwiftData
        do {
            let schema = Schema([
                Exercise.self,
                Schedule.self
            ])
            
            // Try to create the container
            do {
                let modelConfiguration = ModelConfiguration(
                    schema: schema,
                    isStoredInMemoryOnly: false,
                    allowsSave: true
                )
                
                // Delete existing store if it exists
                let storeURL = modelConfiguration.url
                if FileManager.default.fileExists(atPath: storeURL.path) {
                    try? FileManager.default.removeItem(at: storeURL)
                }
                
                container = try ModelContainer(
                    for: schema,
                    configurations: [modelConfiguration]
                )
            } catch {
                print("Failed to create container, attempting with default configuration")
                // If that fails, try with minimal configuration
                container = try ModelContainer(for: schema)
            }
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
        
        // Now that all properties are initialized, we can call methods
        requestNotificationPermission()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(container)
                .environmentObject(exerciseViewModel)
                .environmentObject(scheduleViewModel)
                .environmentObject(templateViewModel)
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


