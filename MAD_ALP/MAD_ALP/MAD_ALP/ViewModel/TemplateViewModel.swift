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

class TemplateViewModel: NSObject, ObservableObject, WCSessionDelegate {
    @Environment(\.modelContext) private var modelContext
    @Published var templates = [Template]()
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
        loadBaseTemplates()
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
        
    private func loadBaseTemplates() {
        let baseTemplates = [
            // push up, squats, pull up
            Template(title: "Full Body Beginner", descriptions: "A balanced routine for beginners targeting all major muscle groups.", exercises: [Exercise(name: "Push Ups", targets: ["Chest, triceos, shoulders, core"], tips: ["Start in a plank position", "Lower your body all the way down, keeping your elbow pits pointed forward and tucked in to your sides", "Push yourself back up to the top of the plank"], image1: ["pushUp1"], image2: ["pushUp2"]), Exercise(name: "Squats", targets: ["Quads, hamstrings, glutes, lower back, core"], tips: ["Stand with feet shoulder-width apart, toes slightly out, and hands comfortably in front while maintaining a neutral posture", "Squat down by bending your hips and knees together, keeping your chest up and knees aligned over your toes", "Push through your heels to return to a standing position, reversing the squat motion"], image1: ["squat1"], image2: ["squat2"]), Exercise(name: "Pull Ups", targets: ["Back, biceps, shoulders"], tips: ["Begin in a dead hang with straight elbows, letting the movement come from your shoulder girdle", "Lift your chest and squeeze your shoulder blades down and back—it's a small but important motion", "Hold the contraction for a few seconds, then release and repeat"], image1: ["pullUp1"], image2: ["pullUp2"]) ]),
            // lunges, squats
           Template(title: "Lower Body Focus", descriptions: "Targets legs, glutes, and core — ideal for strengthening your lower half.", exercises: [Exercise(name: "Lunges", targets: ["Quads, glutes, hamstrings, calves, core"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["lunges1"], image2: ["lunges2"]), Exercise(name: "Squats", targets: ["Quads, hamstrings, glutes, lower back, core"], tips: ["Stand with feet shoulder-width apart, toes slightly out, and hands comfortably in front while maintaining a neutral posture", "Squat down by bending your hips and knees together, keeping your chest up and knees aligned over your toes", "Push through your heels to return to a standing position, reversing the squat motion"], image1: ["squat1"], image2: ["squat2"]) ]),
            // dips, bench press, dumbell rows
           Template(title: "Upper Body Strength", descriptions: "Great for building chest, shoulders, and arms.", exercises: [Exercise(name: "Dips", targets: ["Chest, triceps, shoulders"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["dips1"], image2: ["dips2"]), Exercise(name: "Bench Press", targets: ["Chest, shoulders, triceps"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["benchPress1"], image2: ["benchPress2"]), Exercise(name: "Dumbell Rows", targets: ["Back, biceps, forearms"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["dumbellRows1"], image2: ["dumbellRows2"]),])
        ]

        
        templates = baseTemplates
//        exercises.forEach { exercise in
//            modelContext.insert(exercise)
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            print("Received message: \(message)")
            
//            self.books.append(Book(title: message["title"] as! String, author: message["author"] as! String, image: message["image"] as! String, genre: message["genre"] as! String))
        }
    }
    
    
}


