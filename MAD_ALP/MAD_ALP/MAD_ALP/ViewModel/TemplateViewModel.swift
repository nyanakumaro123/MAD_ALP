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
            Template(title: "Full Body Beginner", descriptions: "A balanced routine for beginners targeting all major muscle groups.", exercises: [Exercise(name: "Push Ups", targets: ["Chest", "Triceps", "Shoulders", "Core"], tips: ["Keep your back straight", "Lower yourself slowly"], images: ["pushUp1", "pushUp2"]), Exercise(name: "Squats", targets: ["Quads", "Hamstrings", "Glutes", "Lower Back", "Core"], tips: ["Feet shoulder-width apart", "Keep your knees behind toes"], images: ["squat1", "squat2"]), Exercise(name: "Pull Ups", targets: ["Back", "Biceps", "Shoulders"], tips: ["Keep your core tight", "Don't let your hips sag"], images: ["pullUp1", "pullUp2"])]),
            Template(title: "Lower Body Focus", descriptions: "Targets legs, glutes, and core — ideal for strengthening your lower half.", exercises: [Exercise(name: "Lunges", targets: ["Quads", "Glutes", "Hamstrings", "Calves", "Core"], tips: ["Keep your core tight", "Don't let your hips sag"], images: ["lunges1", "lunges2"]), Exercise(name: "Squats", targets: ["Quads", "Hamstrings", "Glutes", "Lower Back", "Core"], tips: ["Feet shoulder-width apart", "Keep your knees behind toes"], images: ["squat1", "squat2"])]),
            Template(title: "Upper Body Strength", descriptions: "Great for building chest, shoulders, and arms.", exercises: [Exercise(name: "Dips", targets: ["Chest", "Triceps", "Shoulders"], tips: ["Keep your core tight", "Don't let your hips sag"], images: ["dips1", "dips2"]), Exercise(name: "Bench Press", targets: ["Chest", "Shoulders", "Triceps"], tips: ["Keep your core tight", "Don't let your hips sag"], images: ["benchPress1", "benchPress2"]), Exercise(name: "Dumbell Rows", targets: ["Back", "Biceps", "Forearms"], tips: ["Pull with your elbow", "Keep your back straight"], images: ["dumbellRows1", "dumbellRows2"])])]

        
        templates = baseTemplates
//        exercises.forEach { exercise in
//            modelContext.insert(exercise)
//        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            print("Received message: \(message)")
            
//            self.books.append(Book(title: message["title"] as! String, author: message["author"] as! String, image: message["image"] as! String, genre: message["genre"] as! String))
        }
    }
    
    
}


