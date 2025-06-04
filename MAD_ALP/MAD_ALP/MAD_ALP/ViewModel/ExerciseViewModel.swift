//
//  HomeViewModel.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation
import WatchConnectivity
import SwiftData
import SwiftUICore

class ExerciseViewModel: NSObject, ObservableObject, WCSessionDelegate {
    @Environment(\.modelContext) private var modelContext
    @Published var exercises = [Exercise]()
    var session: WCSession
    
    private let baseDataKey = "hasLoadedBaseExercises"
    
    // Watch
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    // Watch
    
    // Init
    init(session: WCSession = .default) {
        // Watch
        self.session = session
        
        super.init()
        session.delegate = self
        session.activate( )
        
        //loadExercisesIfNeeded()
        loadBaseExercises()
    }
    
//    private func loadExercisesIfNeeded() {
//        let defaults = UserDefaults.standard
//        
//        if !defaults.bool(forKey: baseDataKey) {
//            // First launch - load base exercises
//            loadBaseExercises()
//            
//            // Mark base data as loaded so next time it won't load again
//            defaults.set(true, forKey: baseDataKey)
//        }
//            else {
//                // Not first launch - optionally load saved exercises or leave empty
//                loadSavedExercises()
//            }
//    }
        
    private func loadBaseExercises() {
        let baseExercises = [
            Exercise(name: "Push Ups", targets: ["Chest, triceos, shoulders, core"], tips: ["Keep your back straight", "Lower yourself slowly"], image1: ["pushUp1"], image2: ["pushUp2"]),
            Exercise(name: "Squats", targets: ["Quads, hamstrings, glutes, lower back, core"], tips: ["Feet shoulder-width apart", "Keep your knees behind toes"], image1: ["squat1"], image2: ["squat2"]),
            Exercise(name: "Pull Ups", targets: ["Back, biceps, shoulders"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["pullUp1"], image2: ["pullUp2"]),
            Exercise(name: "Lunges", targets: ["Quads, glutes, hamstrings, calves, core"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["lunges1"], image2: ["lunges2"]),
            Exercise(name: "Dumbell Rows", targets: ["Back, biceps, forearms"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["dumbellRows1"], image2: ["dumbellRows2"]),
            Exercise(name: "Dips", targets: ["Chest, triceps, shoulders"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["dips1"], image2: ["dips2"]),
            Exercise(name: "Bench Press", targets: ["Chest, shoulders, triceps"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["benchPress1"], image2: ["benchPress2"])
        ]
        
        exercises = baseExercises
        exercises.forEach { exercise in
            modelContext.insert(exercise)
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            print("Received message: \(message)")
            
//            self.books.append(Book(title: message["title"] as! String, author: message["author"] as! String, image: message["image"] as! String, genre: message["genre"] as! String))
        }
    }
    
    
}


