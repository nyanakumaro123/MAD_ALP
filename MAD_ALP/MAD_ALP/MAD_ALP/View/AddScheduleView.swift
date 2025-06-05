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
    @State private var isEdit = false
    @State private var scheduleID: UUID = UUID()
    // Data input value
    @State private var title = ""
    @State private var selectedDate: Date = Date()
    @State private var time: Date = Date()
    @State private var selectedExercises: [Exercise] = []
    @State private var tempSelectedExercise: Exercise?
    @State private var showValidationAlert: Bool = false
    @State private var alertMessage = ""
    // Add init
    init(date: Date = Date()) {
        let today = Calendar.current.startOfDay(for: Date())
        let editPastDate = max(date, today)
        _selectedDate = State(initialValue: editPastDate)
        _isEdit = State(initialValue: false)
    }
    // Edit init
    init(id: UUID = UUID(), title: String = "", selectedDate: Date = Date(), time: Date = Date(), selectedExercises: [Exercise] = []) {
        _title = State(initialValue: title)
        _selectedDate = State(initialValue: selectedDate)
        _time = State(initialValue: time)
        _selectedExercises = State(initialValue: selectedExercises)
        _scheduleID = State(initialValue: id)
        _isEdit = State(initialValue: true)
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
                        HStack {
                            Text("Exercise:")
                            Spacer()
                            Button {
                                tempSelectedExercise = nil
                                showingExercisePicker = true
                            } label: {
                                HStack {
                                    Text("Add Exercise")
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            .sheet(isPresented: $showingExercisePicker) {
                                ExerciseSelectionView(selectedExercise: $tempSelectedExercise)
                                    .environmentObject(exerciseViewModel)
                                    .onDisappear {
                                        if let selected = tempSelectedExercise, !selectedExercises.contains(where: { $0.id == selected.id }) {
                                            selectedExercises.append(selected)
                                        }
                                        tempSelectedExercise = nil
                                    }
                            }
                        }
                        // List added exercises
                        if !selectedExercises.isEmpty {
                            ForEach(Array(selectedExercises.enumerated()), id: \.offset) { index, exercise in
                                HStack {
                                    Text(exercise.name)
                                    Spacer()
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
                }
            }
            .navigationTitle(isEdit ? "Edit Schedule" : "Add Schedule")
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
            .navigationBarItems(trailing: Button("Save") {
                if (title == "" || selectedExercises.isEmpty) {
                    if title.isEmpty {
                        alertMessage += "Schedule title is required.\n"
                    }
                    if selectedExercises.isEmpty {
                        alertMessage += "At least one exercise must be selected."
                    }
                    showValidationAlert = true
                }
                else {
                    if (isEdit) {
                        scheduleViewModel.updateSchedule(
                            id: scheduleID,
                            newTitle: title,
                            newDate: selectedDate,
                            newTime: time,
                            newExercises: selectedExercises,
                            context: modelContext
                        )
                        dismiss()
                    }
                    else {
                        scheduleViewModel.addSchedule(
                            title: title,
                            date: selectedDate,
                            time: time,
                            exercises: selectedExercises,
                            context: modelContext)
                        dismiss()
                    }
                }
            })
        }
        .alert("Missing Information", isPresented: $showValidationAlert) {
            Button("OK", role: .cancel) {
                alertMessage = ""
                showValidationAlert = false
            }
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    AddScheduleView()
        .environmentObject(ExerciseViewModel())
        .environmentObject(ScheduleViewModel())
        .modelContainer(for: Exercise.self, inMemory: true)
}


