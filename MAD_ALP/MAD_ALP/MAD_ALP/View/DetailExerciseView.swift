//
//  DetailExerciseView.swift
//  MAD_ALP
//
//  Created by student on 23/05/25.
//

import SwiftUI
import SwiftData

struct DetailExerciseView: View {
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    @Environment(\.modelContext) private var modelContext
    @Query var exercise: [Exercise]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Text("Detail Exercise View")
//                    Image(exercise.image1)
//                        .resizable()
//                        .frame(width: 100, height: 100)
                }
            }
            .navigationTitle(Text("Detail Exercise"))
        }
    }
}

#Preview {
    DetailExerciseView()
        .environmentObject(ExerciseViewModel())
}
