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
                VStack(alignment: .center, spacing: 16) {
                    ForEach(0..<max(exercise.tips.count, exercise.image1.count), id: \.self) { index in
                        
                        // Display Image
                        if index < exercise.image1.count {
                            Image(exercise.image1[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 220)
                                .cornerRadius(8)
                        }
                        
                        // Display Tip
                        if index < exercise.tips.count {
                            Text(exercise.tips[index])
                                .font(.system(size: 16))
                                .padding(.top, 8)
                                .padding(.bottom, 32)
                            
                                .multilineTextAlignment(.center)
                        }
                        
                    }
                }
            }
            .padding(24)
            .navigationTitle(Text("\(exercise.name) Detail"))
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
        }
    }
}

#Preview {
    DetailExerciseView(exercise: Exercise(name: "Push Ups", targets: ["Chest, triceos, shoulders, core"], tips: ["Start in a plank position", "Lower your body all the way down, keeping your elbow pits pointed forward and tucked in to your sides", "Push yourself back up to the top of the plank"], image1: ["pushUp1", "pushUp2", "pushUp1"], image2: ["pushUp2"]))
        .environmentObject(ExerciseViewModel())
}
