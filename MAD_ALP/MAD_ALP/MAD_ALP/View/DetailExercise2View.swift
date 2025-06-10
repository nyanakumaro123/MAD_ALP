//
//  DetailExercise2View.swift
//  MAD_ALP
//
//  Created by NKIS on 05/06/25.
//

import SwiftUI
import SwiftData

struct DetailExercise2View: View {
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    @Environment(\.modelContext) private var modelContext
    @Query var exercise: [Exercise]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        VStack {
                            Image("squat1")
                                .resizable()
                                .frame(width: 200, height: 300)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .offset(y: 30)
                            Text("Stand with feet shoulder-width apart, toes slightly out, and hands comfortably in front while maintaining a neutral posture")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("squat2")
                                .resizable()
                                .frame(width: 200, height: 300)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .offset(y: 30)
                            Text("Squat down by bending your hips and knees together, keeping your chest up and knees aligned over your toes")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                                
                        }
                        .padding(.bottom, 55)
                        VStack {
                            Image("squat1")
                                .resizable()
                                .frame(width: 200, height: 300)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .offset(y: 30)
                            Text("Push through your heels to return to a standing position, reversing the squat motion")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                }
                
            }
            .navigationTitle(Text("Squat Detail"))
        }
    }
}

#Preview {
    DetailExercise2View()
        .environmentObject(ExerciseViewModel())
}
