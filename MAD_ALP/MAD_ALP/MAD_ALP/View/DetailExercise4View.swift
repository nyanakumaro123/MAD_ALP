//
//  DetailExercise4View.swift
//  MAD_ALP
//
//  Created by NKIS on 05/06/25.
//

import SwiftUI
import SwiftData

struct DetailExercise4View: View {
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
                            Image("lunges2")
                                .resizable()
                                .frame(width: 100, height: 300)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Stand up straight, with your feet side by side and your hands resting on your hips")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("lunges1")
                                .resizable()
                                .frame(width: 180, height: 250)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Step forward with one foot, placing your foot flat on the floor once you’ve reached a 90-degree angle. Your lower leg should be perpendicular to the floor, and your thigh should be parallel. At the same time, bend your other leg until your knee touches the floor. Your foot will stretch, but your toes should remain in place")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("lunges2")
                                .resizable()
                                .frame(width: 100, height: 300)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Return your front leg to its original position, reversing the lunges motion")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                }
            }
            .navigationTitle(Text("Lunges Detail"))
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
        }
    }
}

#Preview {
    DetailExercise4View()
        .environmentObject(ExerciseViewModel())
}
