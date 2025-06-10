//
//  ExerciseCardView.swift
//  MAD_ALP
//
//  Created by student on 10/06/25.
//

import SwiftUI

struct ExerciseCardView: View {
    var exercise: Exercise
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(exercise.name)")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(Color(red: 0.25, green: 0.60, blue: 0.50))
                    .padding(.bottom, 4)
                
                if !exercise.tips.isEmpty {
                    Text(tipsPreview)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .truncationMode(.tail)
                }
            }
            Spacer()
            
            if let firstImageName = exercise.image1.first {
                Image(firstImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.trailing, 10)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(20)
        .background(Color(red: 0.88, green: 0.922, blue: 0.843)) // Pastel Mint
        .cornerRadius(12)
    }
    
    var tipsPreview: String {
        let joinedTips = exercise.tips.joined(separator: " ")
        return joinedTips.count > 80 ? String(joinedTips.prefix(80)) + "..." : joinedTips
    }
}

#Preview {
    ExerciseCardView(exercise: Exercise(name: "Push Ups", targets: ["Chest, triceos, shoulders, core"], tips: ["Start in a plank position", "Lower your body all the way down, keeping your elbow pits pointed forward and tucked in to your sides", "Push yourself back up to the top of the plank"], image1: ["pushUp1"], image2: ["pushUp2"]))
    ExerciseCardView(exercise: Exercise(name: "Squats", targets: ["Quads, hamstrings, glutes, lower back, core"], tips: ["Stand with feet shoulder-width apart, toes slightly out, and hands comfortably in front while maintaining a neutral posture", "Squat down by bending your hips and knees together, keeping your chest up and knees aligned over your toes", "Push through your heels to return to a standing position, reversing the squat motion"], image1: ["squat1"], image2: ["squat2"]),)
    ExerciseCardView(exercise: Exercise(name: "Bench Press", targets: ["Chest, shoulders, triceps"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: ["benchPress1"], image2: ["benchPress2"]))
}
