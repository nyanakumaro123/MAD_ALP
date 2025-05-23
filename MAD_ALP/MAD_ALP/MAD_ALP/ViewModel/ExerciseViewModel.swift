//
//  HomeViewModel.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation
import WatchConnectivity
import SwiftData

class ExerciseViewModel: NSObject, ObservableObject, WCSessionDelegate {
    @Published var exercises = [ExerciseGroup]()
    var session: WCSession
    
    private let baseDataKey = "hasLoadedBaseExercises"
    
    // Init
    init(session: WCSession = .default) {
        // Watch
        self.session = session
        
        super.init()
        session.delegate = self
        session.activate( )
        
        loadBaseExercises()
        
    }
    
    // Watch
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    // Watch
    
    private func loadExercisesIfNeeded() {
            let defaults = UserDefaults.standard
            
            if !defaults.bool(forKey: baseDataKey) {
                // First launch - load base exercises
                loadBaseExercises()
                
                // Mark base data as loaded so next time it won't load again
                defaults.set(true, forKey: baseDataKey)
            }
//            else {
//                // Not first launch - optionally load saved exercises or leave empty
//                loadSavedExercises()
//            }
        }
        
    func loadBaseExercises() {
        exercises.append(ExerciseGroup(name: "Chess Day", exercises: [Exercise(name: "", detail: "", image: "")]))
        exercises.append(ExerciseGroup(name: "Leg Day", exercises: [Exercise(name: "", detail: "", image: "")]))
        exercises.append(ExerciseGroup(name: "Back Day", exercises: [Exercise(name: "", detail: "", image: "")]))
        exercises.append(ExerciseGroup(name: "Arm Day", exercises: [Exercise(name: "", detail: "", image: "")]))
        exercises.append(ExerciseGroup(name: "Neck Day", exercises: [Exercise(name: "", detail: "", image: "")]))
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            print("Received message: \(message)")
            
//            self.books.append(Book(title: message["title"] as! String, author: message["author"] as! String, image: message["image"] as! String, genre: message["genre"] as! String))
        }
    }
    
    
}
