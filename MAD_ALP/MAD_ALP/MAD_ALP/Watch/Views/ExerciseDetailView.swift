import SwiftUI

struct ExerciseDetailView: View {
    let exercise: Exercise
    @State private var isWorkoutActive = false
    @State private var elapsedTime = 0
    @State private var timer: Timer?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(exercise.name)
                    .font(.title3)
                    .bold()
                
                if !exercise.targets.isEmpty {
                    Section(header: Text("Target Areas").font(.headline)) {
                        ForEach(exercise.targets, id: \.self) { target in
                            Text("• \(target)")
                                .font(.caption)
                        }
                    }
                }
                
                if !exercise.tips.isEmpty {
                    Section(header: Text("Tips").font(.headline)) {
                        ForEach(exercise.tips, id: \.self) { tip in
                            Text("• \(tip)")
                                .font(.caption)
                        }
                    }
                }
                
                Divider()
                
                VStack(spacing: 8) {
                    if isWorkoutActive {
                        Text(timeString(from: elapsedTime))
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.accentColor)
                        
                        Button(action: stopWorkout) {
                            Text("End Workout")
                                .foregroundColor(.red)
                        }
                    } else {
                        Button(action: startWorkout) {
                            Text("Start Workout")
                        }
                        .buttonStyle(.bordered)
                    }
                }
                .padding(.top)
            }
            .padding()
        }
    }
    
    private func startWorkout() {
        isWorkoutActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            elapsedTime += 1
        }
    }
    
    private func stopWorkout() {
        isWorkoutActive = false
        timer?.invalidate()
        timer = nil
        elapsedTime = 0
    }
    
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}

#Preview {
    ExerciseDetailView(exercise: Exercise(name: "Sample Exercise", targets: ["Arms", "Chest"], tips: ["Keep proper form", "Breathe steadily"]))
} 