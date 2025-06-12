import SwiftUI

struct QuickAddView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var scheduleName = ""
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var selectedExercises: Set<UUID> = []
    
    // Sample exercises - in real app, this would come from WatchSessionManager
    @State private var availableExercises: [Exercise] = []
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Schedule Details")) {
                    TextField("Schedule Name", text: $scheduleName)
                    DatePicker("Date", selection: $selectedDate, displayedComponents: [.date])
                    DatePicker("Time", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                }
                
                Section(header: Text("Select Exercises")) {
                    ForEach(availableExercises) { exercise in
                        Button(action: {
                            if selectedExercises.contains(exercise.id) {
                                selectedExercises.remove(exercise.id)
                            } else {
                                selectedExercises.insert(exercise.id)
                            }
                        }) {
                            HStack {
                                Text(exercise.name)
                                Spacer()
                                if selectedExercises.contains(exercise.id) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.accentColor)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Quick Add")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveSchedule()
                        dismiss()
                    }
                    .disabled(scheduleName.isEmpty || selectedExercises.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            // In real app, get exercises from WatchSessionManager
            // This is just a placeholder
            availableExercises = []
        }
    }
    
    private func saveSchedule() {
        let selectedExercisesList = availableExercises.filter { selectedExercises.contains($0.id) }
        let newSchedule = Schedule(
            id: UUID(),
            title: scheduleName,
            date: selectedDate,
            time: selectedTime,
            exercises: selectedExercisesList
        )
        
        // Send to phone
        WatchSessionManager.shared.sendSchedule(newSchedule)
    }
}

#Preview {
    QuickAddView()
} 