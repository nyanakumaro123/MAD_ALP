//
//  DetailExercise1View.swift
//  MAD_ALP
//
//  Created by NKIS on 05/06/25.
//

import SwiftUI
import SwiftData

struct DetailExercise1View: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
//    @Environment(\.modelContext) private var modelContext
//    @Query var exercises: [Exercise]
    
//    var exercise: Exercise
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        VStack {
                            Image("pushUp1")
                                .resizable()
                                .frame(width: 300, height: 150)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Start in a plank position")
                                .offset(y: 50)
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("pushUp2")
                                .resizable()
                                .frame(width: 300, height: 150)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Lower your body all the way down, keeping your elbow pits pointed forward and tucked in to your sides")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("pushUp1")
                                .resizable()
                                .frame(width: 300, height: 150)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Push yourself back up to the top of the plank")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                    
                   
                }
            }
            .navigationTitle(Text("Push Ups Detail"))
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
        }
    }
}

#Preview {
    DetailExercise1View()
        .environmentObject(ExerciseViewModel())
}
