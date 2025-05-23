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
    
    // Data imput value
    @State private var title = ""
    @State private var selectedDate: Date = Date()
    
    init(title: String = "", date: Date = Date()) {
        _title = State(initialValue: title)
        _selectedDate = State(initialValue: date)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("gym exercise info")) {
                    // Name
                    TextField("Title", text: $title)
                    
                    DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                }
            }
            .navigationTitle("Add Schedule")
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
            .navigationBarItems(trailing: Button("Save") {
//                viewModel.addFoodSpot(
//                    name: name,
//                    location: location,
//                    description: description,
//                    category: category,
//                    visited: visited,
//                    rating: rating,
//                    userID: authViewModel.user?.uid,
//                    context: modelContext
//                )
                dismiss()
            })
        }
    }
}

#Preview {
    AddExerciseView()
//    AddExerciseView(title: "Leg Day", date: ISO8601DateFormatter().date(from: "2021-04-16T00:00:00Z")!)
}
