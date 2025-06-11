//
//  DetailExercise3View.swift
//  MAD_ALP
//
//  Created by NKIS on 05/06/25.
//

import SwiftUI
import SwiftData

struct DetailExercise3View: View {
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
                            Image("pullUp1")
                                .resizable()
                                .frame(width: 200, height: 300)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .offset(y: 30)
                            Text("Start in a dead hang position on the rings or a bar. Your elbows should be straight, with the movement occurring completely at the shoulder girdle, not in your arms")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("pullUp2")
                                .resizable()
                                .frame(width: 200, height: 300)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .offset(y: 30)
                            Text("Lift your chest up and squeeze your shoulder blades down and back. It’s a relatively small movement, but it’s crucial for getting the most out of your pulling exercises")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("pullUp1")
                                .resizable()
                                .frame(width: 200, height: 300)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .offset(y: 30)
                            Text("Contract the shoulder girdle strongly, hold for a couple seconds, then release and reversing the pull up motion")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                }
            }
            .navigationTitle(Text("Pull Ups Detail"))
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
        }
    }
}


#Preview {
    DetailExercise3View()
        .environmentObject(ExerciseViewModel())
}
