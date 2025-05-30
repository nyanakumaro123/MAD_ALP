//
//  ScheduleCard.swift
//  MAD_ALP
//
//  Created by student on 30/05/25.
//

import SwiftUI

struct ScheduleCard: View {
    var schedule: Schedule
    
    var body: some View {
        VStack {
            Text("\(schedule.title)")
            
        }
    }
}

#Preview {
    ScheduleCard(schedule: Schedule(title: "TitleName", date: Date(), time: Date(), exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]) )
}
