//
//  ExerciseSelectionView.swift
//  MAD_ALP
//
//  Created by student on 23/05/25.
//

import SwiftUI

struct ExerciseSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    @Binding var selectedExercise: Exercise?
    @State private var searchText: String = ""
    
    var filteredExercises: [Exercise] {
        exerciseViewModel.exercises.filter { exercise in
            searchText.isEmpty || exercise.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredExercises) { exercise in
                    Button(action: {
                        selectedExercise = exercise
                        dismiss()
                    }) {
                        Text(exercise.name)
                            .font(.body)
                            .padding(.vertical, 8)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("Select Exercise")
            .searchable(text: $searchText)
        }
        .onAppear {
            if let selected = selectedExercise {
                selectedExercise = exerciseViewModel.exercises.first(where: { $0.id == selected.id })
            }
        }

    }
}

#Preview {
    ExerciseSelectionView(
        selectedExercise: .constant(nil)
    )
    .environmentObject({
        let viewModel = ExerciseViewModel()
        viewModel.exercises = [
            Exercise(name: "Push Up", tips: ["Keep back straight"]),
            Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])
        ]
        return viewModel
    }())
}


