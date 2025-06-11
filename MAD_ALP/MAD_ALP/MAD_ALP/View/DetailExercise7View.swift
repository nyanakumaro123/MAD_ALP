//
//  DetailExercise7View.swift
//  MAD_ALP
//
//  Created by NKIS on 05/06/25.
//

import SwiftUI
import SwiftData

struct DetailExercise7View: View {
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
                            Image("benchPress1")
                                .resizable()
                                .frame(width: 200, height: 200)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Open your shoulders when you pull the barbell down toward your chest, your shoulders should be rotating externally, or opening outward")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("benchPress2")
                                .resizable()
                                .frame(width: 200, height: 200)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Bend the barbell in half while lowering and pretend you are trying to snap the bar in half in a downward motion. This will help with opening your shoulders and keeping proper form")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("benchPress1")
                                .resizable()
                                .frame(width: 200, height: 200)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
                                .offset(y: 30)
                            Text("Pull the barbell apart when you push back up on the barbell and pretend as if you are trying to pull it apart, splitting it in the middle. This will keep your shoulders back and your chest flat")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                }
            }
            .navigationTitle(Text("Bench Press Detail"))
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
        }
    }
}

#Preview {
    DetailExercise7View()
        .environmentObject(ExerciseViewModel())
}
