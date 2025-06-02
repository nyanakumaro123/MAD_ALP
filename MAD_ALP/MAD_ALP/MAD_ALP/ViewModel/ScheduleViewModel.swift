//
//  HomeViewModel.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation
import WatchConnectivity
import SwiftData
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
    
    init(session: WCSession = .default) {
        // Watch
        self.session = session
        
        super.init()
        session.delegate = self
        session.activate( )
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            print("Received message: \(message)")
            
//            self.books.append(Book(title: message["title"] as! String, author: message["author"] as! String, image: message["image"] as! String, genre: message["genre"] as! String))
        }
    }
    
    func addSchedule(title: String, date: Date, time: Date, exercises: [Exercise], context: ModelContext) {
        let newSchedule = Schedule(
            title: title,
            date: date,
            time: time,
            exercises: exercises
        )
        
        context.insert(newSchedule)
        try? context.save()
    }
    
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
