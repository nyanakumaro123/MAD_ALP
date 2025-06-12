//
//  HomeViewModel.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation
import WatchConnectivity
import SwiftData
import UserNotifications
//import SwiftData

class ScheduleViewModel: NSObject, ObservableObject, WCSessionDelegate {
    // Watch
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    // Watch
    
    // Init
    @Published var schedules = [Schedule]()
    var session: WCSession
    private var modelContext: ModelContext?
    
    init(session: WCSession = .default) {
        // Watch
        self.session = session
        
        super.init()
        session.delegate = self
        session.activate()
        
        // Request notification permissions
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else if let error = error {
                print("Error requesting notification permission: \(error)")
            }
        }
    }
    
    func setModelContext(_ context: ModelContext) {
        self.modelContext = context
        fetchSchedules()
    }
    
    private func fetchSchedules() {
        guard let context = modelContext else { return }
        
        let descriptor = FetchDescriptor<Schedule>(sortBy: [SortDescriptor(\.date)])
        do {
            let fetchedSchedules = try context.fetch(descriptor)
            DispatchQueue.main.async {
                self.schedules = fetchedSchedules
            }
        } catch {
            print("Failed to fetch schedules: \(error)")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            print("Received message: \(message)")
        }
    }
    
    private func scheduleExerciseNotification(title: String, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Exercise Starting Soon"
        content.body = "Your exercise '\(title)' starts in 15 minutes"
        content.sound = .default
        
        let calendar = Calendar.current
        // Subtract 15 minutes from the event time
        guard let notificationDate = calendar.date(byAdding: .minute, value: -15, to: date) else {
            print("Error calculating notification time")
            return
        }
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled for \(notificationDate)")
            }
        }
    }
    
    // Add
    func addSchedule(title: String, date: Date, time: Date, exercises: [Exercise], context: ModelContext) {
        let newSchedule = Schedule(
            title: title,
            date: date,
            time: time,
            exercises: exercises
        )
        
        context.insert(newSchedule)
        try? context.save()
        
        // Update the published schedules array
        DispatchQueue.main.async {
            self.schedules.append(newSchedule)
            self.schedules.sort { $0.date < $1.date }
        }
        
        let calendar = Calendar.current
        let dateWithTime = calendar.date(
            bySettingHour: calendar.component(.hour, from: time),
            minute: calendar.component(.minute, from: time),
            second: 0,
            of: date
        ) ?? date
        
        scheduleExerciseNotification(title: title, date: dateWithTime)
    }
    
    // Update
    func updateSchedule(id: UUID, newTitle: String, newDate: Date, newTime: Date, newExercises: [Exercise], context: ModelContext) {
        let fetchDescriptor = FetchDescriptor<Schedule>(
            predicate: #Predicate { $0.id == id }
        )

        do {
            let results = try context.fetch(fetchDescriptor)
            guard let scheduleToUpdate = results.first else {
                print("Schedule with ID \(id) not found.")
                return
            }

            scheduleToUpdate.title = newTitle
            scheduleToUpdate.date = newDate
            scheduleToUpdate.time = newTime
            scheduleToUpdate.exercises = newExercises

            try context.save()
            
            // Update the published schedules array
            if let index = schedules.firstIndex(where: { $0.id == id }) {
                DispatchQueue.main.async {
                    self.schedules[index] = scheduleToUpdate
                    self.schedules.sort { $0.date < $1.date }
                }
            }
            
            print("Schedule updated successfully.")
        }
        catch {
            print("Failed to update schedule: \(error)")
        }
    }

    // Delete
    func deleteSchedule(withID id: UUID, in context: ModelContext) {
        let fetchDescriptor = FetchDescriptor<Schedule>(
            predicate: #Predicate { schedule in
                schedule.id == id
            }
        )
        
        do {
            let schedulesToDelete = try context.fetch(fetchDescriptor)
            
            for schedule in schedulesToDelete {
                context.delete(schedule)
                // Remove from published schedules array
                if let index = schedules.firstIndex(where: { $0.id == id }) {
                    DispatchQueue.main.async {
                        self.schedules.remove(at: index)
                    }
                }
            }
            
            try context.save()
            print("Schedule(s) deleted successfully.")
            
        } catch {
            print("Failed to fetch or delete schedule(s): \(error)")
        }
    }
    
//    func deleteSchedules(from schedules: [Schedule], at offsets: IndexSet, in context: ModelContext) {
//        for index in offsets {
//            guard index < schedules.count else { continue }
//            let scheduleToDelete = schedules[index]
//            context.delete(scheduleToDelete)
//        }
//
//        do {
//            try context.save()
//        } catch {
//            print("Failed to delete schedule(s): \(error)")
//        }
//    }

}
