//
//  AddExerciseView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI
import SwiftData

struct AddScheduleView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @State private var showingExercisePicker = false
    
    // Data imput value
    @State private var title = ""
    @State private var selectedDate: Date = Date()
    @State private var time: Date = Date()
    @State private var selectedExercises: [Exercise] = []
    @State private var tempSelectedExercise: Exercise?
    
    init(title: String = "", date: Date = Date()) {
        let today = Calendar.current.startOfDay(for: Date())
        let editPastDate = max(date, today)
                                        
        _title = State(initialValue: title)
        _selectedDate = State(initialValue: editPastDate)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("gym exercise info")) {
                    // Name
                    TextField("Title", text: $title)
                    
                    // Date
                    DatePicker("Date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                    
                    // Time picker
                    DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                        .datePickerStyle(CompactDatePickerStyle())
                    
                    // Exercise selection
                    Section(header: Text("Exercises")) {
                        Button {
                            showingExercisePicker = true
                        } label: {
                            HStack {
                                Text("Add Exercise")
                                Spacer()
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }

                        // List added exercises
                        if !selectedExercises.isEmpty {
                            ForEach(Array(selectedExercises.enumerated()), id: \.offset) { index, exercise in
                                HStack {
                                    Text(exercise.name)
                                    Spacer()
                                    
                                    // Delete button
                                    Button(action: {
                                        selectedExercises.remove(at: index)
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $showingExercisePicker) {
                        ExerciseSelectionView(selectedExercise: $tempSelectedExercise)
                            .environmentObject(exerciseViewModel)
                            .onDisappear {
                                if let selected = tempSelectedExercise/*, !selectedExercises.contains(where: { $0.id == selected.id })*/ {
                                    selectedExercises.append(selected)
                                }
                                tempSelectedExercise = nil
                            }
                    }

                    
                }
            }
            .navigationTitle("Add Schedule")
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
            .navigationBarItems(trailing: Button("Save") {
//                scheduleViewModel.addSchedule(
//                    title: title,
//                    date: selectedDate,
//                    time: <#T##Date#>,
//                    exercises: <#T##[Exercise]#>,
//                    context: <#T##ModelContext#>)
//                dismiss()
            })
        }
    }
}

#Preview {
    AddScheduleView()
        .environmentObject(ExerciseViewModel())
        .environmentObject(ScheduleViewModel())
        .modelContainer(for: Exercise.self, inMemory: true)
//    AddExerciseView(title: "Leg Day", date: ISO8601DateFormatter().date(from: "2021-04-16T00:00:00Z")!)
}
