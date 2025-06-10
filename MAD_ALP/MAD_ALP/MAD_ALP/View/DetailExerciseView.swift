//
//  DetailExerciseView.swift
//  MAD_ALP
//
//  Created by student on 23/05/25.
//

import SwiftUI
import SwiftData

struct DetailExerciseView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    var exercise: Exercise
//    @Environment(\.modelContext) private var modelContext
//    @Query var exercise: [Exercise]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Text("Detail Exercise View")

                }
            }
            .navigationTitle(Text("\(exercise.name) Detail"))
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
        }
    }
}

#Preview {
    DetailExerciseView(exercise: Exercise(name: "Push Ups", targets: ["Chest, triceos, shoulders, core"], tips: ["Start in a plank position", "Lower your body all the way down, keeping your elbow pits pointed forward and tucked in to your sides", "Push yourself back up to the top of the plank"], image1: ["pushUp1"], image2: ["pushUp2"]))
        .environmentObject(ExerciseViewModel())
}
