//
//  DetailExercise3View.swift
//  MAD_ALP
//
//  Created by NKIS on 05/06/25.
//

import SwiftUI
import SwiftData

struct DetailExercise3View: View {
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    
    @Environment(\.modelContext) private var modelContext
    @Query var exercise: [Exercise]
    
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
                            Text("Begin in a dead hang with straight elbows, letting the movement come from your shoulder girdle")
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
                            Text("Lift your chest and squeeze your shoulder blades down and back—it's a small but important motion")
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
                            Text("Hold the contraction for a few seconds, then release and repeat")
                                .offset(y: 50)
                                .frame(width: 300)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                }
            }
            .navigationTitle(Text("Detail Exercise"))
        }
    }
}


#Preview {
    DetailExercise3View()
        .environmentObject(ExerciseViewModel())
}
