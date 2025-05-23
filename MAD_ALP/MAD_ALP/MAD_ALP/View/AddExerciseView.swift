//
//  AddExerciseView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI
import SwiftData

//struct AddExerciseView: View {
//    @Environment(\.dismiss) var dismiss
//    @Environment(\.modelContext) private var modelContext
//    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
//    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
//    
//    // Data imput value
//    @State private var title = ""
//    @State private var selectedDate: Date = Date()
//    @State private var time: Date = Date()
//    @State private var selectedExercise: Exercise?
//    
//    init(title: String = "", date: Date = Date()) {
//        let today = Calendar.current.startOfDay(for: Date())
//        let editPastDate = max(date, today)
//                                        
//        _title = State(initialValue: title)
//        _selectedDate = State(initialValue: editPastDate)
//    }
    
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("gym exercise info")) {
//                    // Name
//                    TextField("Title", text: $title)
//                    
//                    // Date
//                    DatePicker("Date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
//                    
//                    // Time picker
//                    DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
//                        .datePickerStyle(CompactDatePickerStyle())
//                    
//                    // Sport
//                    VStack {
//                        Picker("Select Exercise", selection: $selectedExercise) {
//                            ForEach(exerciseViewModel.exercises, id: \.self) { exercise in
//                                Text(exercise.name).tag(Optional(exercise))
//                            }
//                        }
//                        .pickerStyle(WheelPickerStyle()) // or .menu, .segmented, etc.
//                        
//                        if let selected = selectedExercise {
//                            Text("Tips for \(selected.name):")
//                                .font(.headline)
//                                .padding(.top)
//                            
//                            ForEach(selected.tips, id: \.self) { tip in
//                                Text("• \(tip)")
//                            }
//                        } else {
//                            Text("No exercise selected")
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    
//                }
//            }
//            .navigationTitle("Add Schedule")
//            .navigationBarItems(leading: Button("Cancel") {
//                dismiss()
//            })
//            .navigationBarItems(trailing: Button("Save") {
////                viewModel.addFoodSpot(
////                    name: name,
////                    location: location,
////                    description: description,
////                    category: category,
////                    visited: visited,
////                    rating: rating,
////                    userID: authViewModel.user?.uid,
////                    context: modelContext
////                )
//                dismiss()
//            })
//        }
//    }
//}

//#Preview {
//    AddExerciseView()
//        .environmentObject(ExerciseViewModel())
//        .environmentObject(ScheduleViewModel())
////    AddExerciseView(title: "Leg Day", date: ISO8601DateFormatter().date(from: "2021-04-16T00:00:00Z")!)
//}
