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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Date: \(schedule.date, style: .date)")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.bottom, 8)

                    Text("Time: \(schedule.date, style: .time)")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .padding(.bottom, 24)
                    
                    Text("\(schedule.exercises.count == 1 ? "Exercise" : "Exercises") List:")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.bottom, 8)
                    ForEach(schedule.exercises) { exercise in
                        // Exercise card
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
        
    }
}

#Preview {
    DetailScheduleView(schedule: Schedule(title: "TitleName", date: Date(), time: Date(), exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]) )
}
