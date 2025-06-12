import Foundation
import WatchConnectivity

class WatchSessionManager: NSObject, ObservableObject {
    static let shared = WatchSessionManager()
    
    @Published var isReachable = false
    @Published var receivedSchedules: [Schedule] = []
    
    private override init() {
        super.init()
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func sendSchedule(_ schedule: Schedule) {
        guard WCSession.default.isReachable else {
            print("Watch is not reachable")
            return
        }
        
        let scheduleData: [String: Any] = [
            "id": schedule.id.uuidString,
            "title": schedule.title,
            "date": schedule.date,
            "time": schedule.time,
            "exercises": schedule.exercises.map { exercise in
                [
                    "id": exercise.id.uuidString,
                    "name": exercise.name,
                    "targets": exercise.targets,
                    "tips": exercise.tips
                ]
            }
        ]
        
        do {
            try WCSession.default.updateApplicationContext(["schedule": scheduleData])
        } catch {
            print("Error sending schedule to watch: \(error)")
        }
    }
    
    func sendExerciseList(_ exercises: [Exercise]) {
        guard WCSession.default.isReachable else {
            print("Watch is not reachable")
            return
        }
        
        let exercisesData: [[String: Any]] = exercises.map { exercise in
            [
                "id": exercise.id.uuidString,
                "name": exercise.name,
                "targets": exercise.targets,
                "tips": exercise.tips
            ]
        }
        
        do {
            try WCSession.default.updateApplicationContext(["exercises": exercisesData])
        } catch {
            print("Error sending exercises to watch: \(error)")
        }
    }
}

// MARK: - WCSessionDelegate
extension WatchSessionManager: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        DispatchQueue.main.async {
            self.isReachable = session.isReachable
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        DispatchQueue.main.async {
            self.isReachable = session.isReachable
        }
    }
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) {
        WCSession.default.activate()
    }
    #endif
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        DispatchQueue.main.async {
            if let scheduleData = applicationContext["schedule"] as? [String: Any] {
                // Handle received schedule data
                self.handleReceivedSchedule(scheduleData)
            }
            
            if let exercisesData = applicationContext["exercises"] as? [[String: Any]] {
                // Handle received exercises data
                self.handleReceivedExercises(exercisesData)
            }
        }
    }
    
    private func handleReceivedSchedule(_ scheduleData: [String: Any]) {
        guard let idString = scheduleData["id"] as? String,
              let id = UUID(uuidString: idString),
              let title = scheduleData["title"] as? String,
              let date = scheduleData["date"] as? Date,
              let time = scheduleData["time"] as? Date,
              let exercisesData = scheduleData["exercises"] as? [[String: Any]] else {
            return
        }
        
        let exercises = exercisesData.compactMap { exerciseData -> Exercise? in
            guard let idString = exerciseData["id"] as? String,
                  let id = UUID(uuidString: idString),
                  let name = exerciseData["name"] as? String,
                  let targets = exerciseData["targets"] as? [String],
                  let tips = exerciseData["tips"] as? [String] else {
                return nil
            }
            
            return Exercise(id: id, name: name, targets: targets, tips: tips)
        }
        
        let schedule = Schedule(id: id, title: title, date: date, time: time, exercises: exercises)
        
        if !self.receivedSchedules.contains(where: { $0.id == schedule.id }) {
            self.receivedSchedules.append(schedule)
        }
    }
    
    private func handleReceivedExercises(_ exercisesData: [[String: Any]]) {
        // Handle received exercises - implement as needed for your app
        print("Received exercises data: \(exercisesData)")
    }
} 
