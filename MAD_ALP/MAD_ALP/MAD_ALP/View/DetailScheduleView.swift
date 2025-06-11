//
//  DetailScheduleView.swift
//  MAD_ALP
//
//  Created by student on 30/05/25.
//

import SwiftUI

struct DetailScheduleView: View {
    @Environment(\.dismiss) var dismiss
    
    var schedule: Schedule
    @State private var showEdit = false
    @State private var showDetail = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        // Date, Time
                        VStack(alignment: .leading) {
                            // Date
                            Text("Date: \(schedule.date, style: .date)")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .padding(.bottom, 8)
                                
                            // Time
                            Text("Time: \(schedule.date, style: .time)")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                        }
                        Spacer()
                        
                        // Edit Button
                        Button(action: {
                            showEdit = true
                        }) {
                            Text("Edit")
                                .foregroundColor(.black)
                                .padding(4)
                                .padding(.horizontal, 16)
                                .background(Color.yellow)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.bottom, 24)
                    
                    // Exercise List
                    Text("\(schedule.exercises.count == 1 ? "Exercise" : "Exercises") List:")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.bottom, 8)
                    ForEach(schedule.exercises) { exercise in
                        // Exercise card
                        ExerciseCardView(exercise: exercise)
                        
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationBarItems(leading: Button("Back") {
                dismiss()
            })
            .navigationTitle(Text("\(schedule.title) Details"))
        }
        .fullScreenCover(isPresented: $showEdit) {
            AddScheduleView(
                id: schedule.id,
                title: schedule.title,
                selectedDate: schedule.date,
                time: schedule.time,
                selectedExercises: schedule.exercises
            )
        }
        
    }
}

#Preview {
    DetailScheduleView(schedule: Schedule(title: "TitleName", date: Date(), time: Date(), exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]) )
}
