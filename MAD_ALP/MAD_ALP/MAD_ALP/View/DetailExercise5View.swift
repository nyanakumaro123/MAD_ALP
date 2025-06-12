//
//  DetailExercise5View.swift
//  MAD_ALP
//
//  Created by NKIS on 05/06/25.
//

import SwiftUI
import SwiftData

struct DetailExercise5View: View {
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
                            Image("dumbellRows1")
                                .resizable()
                                .frame(width: 200, height: 200)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Stand with your feet at shoulder width apart in front of the bench. Push your butt back and lower your torso down, extending your off arm to rest your palm on the bench. Make sure your shoulders stay above your hips")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("dumbellRows2")
                                .resizable()
                                .frame(width: 200, height: 200)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Grab the dumbbell with your working hand. Squeeze your glutes and abs to create full-body tension. Your back should be flat, with your head in a neutral position")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("dumbellRows1")
                                .resizable()
                                .frame(width: 200, height: 200)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Squeeze your mid-back muscles to drive your elbow up, rowing the weight. Keep your shoulders level and avoid rotating your lower back and reversing the dumbell rows motion")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                }
            }
            .navigationTitle(Text("Dumbell Rows Detail"))
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
        }
    }
}

#Preview {
    DetailExercise5View()
        .environmentObject(ExerciseViewModel())
}
