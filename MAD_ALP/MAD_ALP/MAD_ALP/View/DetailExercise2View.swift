//
//  DetailExercise2View.swift
//  MAD_ALP
//
//  Created by NKIS on 05/06/25.
//

import SwiftUI
import SwiftData

struct DetailExercise2View: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
//    @Environment(\.modelContext) private var modelContext
//    @Query var exercise: [Exercise]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        VStack {
                            Image("squat1")
                                .resizable()
                                .frame(width: 200, height: 300)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Stand up straight, with your feet shoulder-width apart and your hands in front of you in a comfortable position. Toes should be pointing slightly outwards. Look forward, keeping your posture neutral")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("squat2")
                                .resizable()
                                .frame(width: 200, height: 300)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Squat down as if you were going to sit in a chair. Bend at the knees and the hips at the same time keeping the chest up. Allow the knees to track over the toes")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("squat1")
                                .resizable()
                                .frame(width: 200, height: 300)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Gently stand up straight, putting your weight on your heels and reversing the squatting motion")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                }
                
            }
            .navigationTitle(Text("Squats Detail"))
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
        }
    }
}

#Preview {
    DetailExercise2View()
        .environmentObject(ExerciseViewModel())
}
