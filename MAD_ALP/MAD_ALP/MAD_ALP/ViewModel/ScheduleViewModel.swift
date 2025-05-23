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
}
