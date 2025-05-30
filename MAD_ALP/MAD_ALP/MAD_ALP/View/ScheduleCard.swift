//
//  ScheduleCard.swift
//  MAD_ALP
//
//  Created by student on 30/05/25.
//

import SwiftUI

struct ScheduleCard: View {
    var schedule: Schedule
    var index: Int
    
    @State private var showDetail = false

    var backgroundColor: Color {
        let colors: [Color] = [
            Color(red: 0.639, green: 0.81, blue: 0.945),   // Pastel Blue
            Color(red: 1.0, green: 0.75, blue: 0.8),  // Pastel Salmon
            Color(red: 0.71, green: 0.922, blue: 0.843)    // Pastel Mint
        ]
        return colors[index % colors.count]
    }

    
    var body: some View {
        HStack() {
            VStack(alignment: .leading){
                Text("\(schedule.title)")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(.black)
                    .padding(.bottom, 4)
                
                Text("Date: \(schedule.date, style: .date) - \(schedule.time, style: .time)")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundStyle(.black)
            }
            Spacer()
            
            // Invisible button
            Button(action: {
                showDetail = true
            }) {
                Text("")
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(20)
        .background(backgroundColor)
        .cornerRadius(12)
        //.padding(12)
        .fullScreenCover(isPresented: $showDetail) {
            DetailScheduleView(schedule: schedule)
        }
    }
}

#Preview {
    ScheduleCard(schedule: Schedule(title: "TitleName", date: Date(), time: Date(), exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]), index: 1)
}
