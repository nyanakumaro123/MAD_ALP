//
//  ExerciseSelectionView.swift
//  MAD_ALP
//
//  Created by student on 23/05/25.
//

import SwiftUI
import SwiftData

struct ExerciseSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    @Environment(\.modelContext) private var modelContext
    @Query var exercise: [Exercise]
    
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
//                        Text(exercise.targets)
                    }
                }
            }
            .navigationTitle("Select Exercise")
            .searchable(text: $searchText)
        }
//        .onAppear {
//            if let selected = selectedExercise {
//                selectedExercise = exerciseViewModel.exercises.first(where: { $0.id == selected.id })
//            }
//        }

    }
}

#Preview {
    ExerciseSelectionView(
        selectedExercise: .constant(nil)
    )
    .environmentObject({
        let viewModel = ExerciseViewModel()
        return viewModel
    }())
}


