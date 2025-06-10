//
//  ExerciseCardView.swift
//  MAD_ALP
//
//  Created by Student on 10/06/25.
//

import SwiftUI

struct ExerciseCardView: View {
    var exercise: Exercise
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 0.973, green: 0.973, blue: 0.973))
                .frame(width: 350, height: 80)
                .cornerRadius(20)
            Text(exercise.name)
        }
    }
}

#Preview {
    ExerciseCardView(exercise: Exercise(name: "Push Up"))
}
