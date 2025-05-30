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
        Text("Details of \(schedule.title)")
        Button("Close") {
            dismiss()
        }
    }
}

#Preview {
    DetailScheduleView(schedule: Schedule(title: "TitleName", date: Date(), time: Date(), exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]) )
}
