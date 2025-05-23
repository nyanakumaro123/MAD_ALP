//
//  AddExerciseView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI
import SwiftData

struct AddExerciseView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @State private var showingExercisePicker = false
    
    // Data imput value
    @State private var title = ""
    @State private var selectedDate: Date = Date()
    @State private var time: Date = Date()
    @State private var selectedExercise: Exercise?
    
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
                    Section() {
                        Button {
                            showingExercisePicker = true
                        } label: {
                            HStack {
                                Text("Exercise")
                                    .foregroundColor(.black)
                                Spacer()
                                Text(selectedExercise?.name ?? "Select")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .sheet(isPresented: $showingExercisePicker) {
                        ExerciseSelectionView(selectedExercise: $selectedExercise)
                            .environmentObject(exerciseViewModel)
                    }
                    
                }
            }
            .onAppear {
                if selectedExercise == nil {
                    selectedExercise = exerciseViewModel.exercises.first
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
    AddExerciseView()
        .environmentObject(ExerciseViewModel())
        .environmentObject(ScheduleViewModel())
        .modelContainer(for: Exercise.self, inMemory: true)
//    AddExerciseView(title: "Leg Day", date: ISO8601DateFormatter().date(from: "2021-04-16T00:00:00Z")!)
}
