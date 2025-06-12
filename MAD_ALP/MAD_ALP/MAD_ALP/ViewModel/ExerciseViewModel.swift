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
            Exercise(name: "Push Ups", targets: ["Chest, triceos, shoulders, core"], tips: ["Start in a plank position", "Lower your body all the way down, keeping your elbow pits pointed forward and tucked in to your sides", "Push yourself back up to the top of the plank"], image1: ["pushUp1"], image2: ["pushUp2"]),
            Exercise(name: "Squats", targets: ["Quads, hamstrings, glutes, lower back, core"], tips: ["Stand up straight, with your feet shoulder-width apart and your hands in front of you in a comfortable position. Toes should be pointing slightly outwards. Look forward, keeping your posture neutral", "Squat down as if you were going to sit in a chair. Bend at the knees and the hips at the same time keeping the chest up. Allow the knees to track over the toes", "Gently stand up straight, putting your weight on your heels and reversing the squatting motion"], image1: ["squat1"], image2: ["squat2"]),
            Exercise(name: "Pull Ups", targets: ["Back, biceps, shoulders"], tips: ["Start in a dead hang position on the rings or a bar. Your elbows should be straight, with the movement occurring completely at the shoulder girdle, not in your arms", "Lift your chest up and squeeze your shoulder blades down and back. It’s a relatively small movement, but it’s crucial for getting the most out of your pulling exercises", "Contract the shoulder girdle strongly, hold for a couple seconds, then release and reversing the pull up motion"], image1: ["pullUp1"], image2: ["pullUp2"]),
            Exercise(name: "Lunges", targets: ["Quads, glutes, hamstrings, calves, core"], tips: ["Stand up straight, with your feet side by side and your hands resting on your hips", "Step forward with one foot, placing your foot flat on the floor once you’ve reached a 90-degree angle. Your lower leg should be perpendicular to the floor, and your thigh should be parallel. At the same time, bend your other leg until your knee touches the floor. Your foot will stretch, but your toes should remain in place", "Return your front leg to its original position, reversing the lunges motion"], image1: ["lunges1"], image2: ["lunges2"]),
            Exercise(name: "Dumbell Rows", targets: ["Back, biceps, forearms"], tips: ["Stand with your feet at shoulder width apart in front of the bench. Push your butt back and lower your torso down, extending your off arm to rest your palm on the bench. Make sure your shoulders stay above your hips", "Grab the dumbbell with your working hand. Squeeze your glutes and abs to create full-body tension. Your back should be flat, with your head in a neutral position", "Squeeze your mid-back muscles to drive your elbow up, rowing the weight. Keep your shoulders level and avoid rotating your lower back and reversing the dumbell rows motion"], image1: ["dumbellRows1"], image2: ["dumbellRows2"]),
            Exercise(name: "Dips", targets: ["Chest, triceps, shoulders"], tips: ["Use an overhand grip to hold the rails or rings with straight arms. Contract your core and take your full body weight onto your arms, bending your knees so your feet are off the ground", "Bend your elbows and lower your body slowly. Begin by lowering for two seconds or as low as you can without significant discomfort in your shoulders", "Pause in the low position for a second or two, press back up to the upright position and reversing the dips motion"], image1: ["dips1"], image2: ["dips2"]),
            Exercise(name: "Bench Press", targets: ["Chest, shoulders, triceps"], tips: ["Open your shoulders when you pull the barbell down toward your chest, your shoulders should be rotating externally, or opening outward", "Bend the barbell in half while lowering and pretend you are trying to snap the bar in half in a downward motion. This will help with opening your shoulders and keeping proper form", "Pull the barbell apart when you push back up on the barbell and pretend as if you are trying to pull it apart, splitting it in the middle. This will keep your shoulders back and your chest flat"], image1: ["benchPress1"], image2: ["benchPress2"])
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


