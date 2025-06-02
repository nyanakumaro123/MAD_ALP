//
//  ScheduleCard.swift
//  MAD_ALP
//
//  Created by student on 30/05/25.
//

import SwiftUI
import _SwiftData_SwiftUI

struct TemplateCard: View {
    var schedule: Schedule
    var index: Int

    @State private var showDetail = false
    
    @State private var offsetX: CGFloat = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @Environment(\.modelContext) private var modelContext
    @Query var schedules: [Schedule]

    var backgroundColor: Color {
        let colors: [Color] = [
            Color(red: 0.639, green: 0.81, blue: 0.945),   // Pastel Blue
            Color(red: 1.0, green: 0.75, blue: 0.8),  // Pastel Salmon
            Color(red: 0.71, green: 0.922, blue: 0.843)    // Pastel Mint
        ]
        return colors[index % colors.count]
    }
    
    var textColorr: Color {
        let textColors: [Color] = [
            Color(red: 0.20, green: 0.50, blue: 0.70),      // Darker Blue
            Color(red: 0.75, green: 0.35, blue: 0.45),      // Coral Pink
            Color(red: 0.25, green: 0.60, blue: 0.50)       // Deeper Mint
        ]
        return textColors[index % textColors.count]
    }

    
    var body: some View {
        ZStack(alignment: .trailing) {
            // Background delete button
            HStack() {
                Spacer()
                Button {
                    withAnimation {
                        // handle delete
                        scheduleViewModel.deleteSchedule(withID: schedule.id, in: modelContext)
                    }
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .font(.system(size: 40))
                }
                .padding(.trailing, 20)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text("\(schedule.title)")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(textColorr)
                    .padding(.bottom, 4)
                
                Text("Date: \(schedule.date, style: .date) - \(schedule.time, style: .time)")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundStyle(textColorr)
                    .padding(.bottom, 8)
                
                // scrollabe square exercise text name
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(schedule.exercises, id: \.id) { exercise in
                            VStack {
                                Text(exercise.name)
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundStyle(textColorr)
                                    .multilineTextAlignment(.center)
                                    .padding(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .padding(20)
            .background(backgroundColor)
            .offset(x: offsetX + dragOffset)
            .onTapGesture {
                if offsetX == 0 {
                    withAnimation { showDetail = true }
                }
                else {
                    withAnimation { offsetX = 0 }
                }
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(12)
        //.padding(12)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        if value.translation.width < 0 {
                            state = value.translation.width
                        }
                    }
                    .onEnded { value in
                        if value.translation.width < -100 {
                            withAnimation {
                                offsetX = -80
                            }
                        } else {
                            withAnimation {
                                offsetX = 0
                            }
                        }
                    }
            )
        .contentShape(Rectangle()) // Ensures whole card is tappable
        .fullScreenCover(isPresented: $showDetail) {
            DetailScheduleView(schedule: schedule)
        }
    }
}

#Preview {
    ScheduleCard(schedule: Schedule(title: "TitleName", date: Date(), time: Date(), exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]), index: 0)
    ScheduleCard(schedule: Schedule(title: "TitleName", date: Date(), time: Date(), exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]), index: 1)
    ScheduleCard(schedule: Schedule(title: "TitleName", date: Date(), time: Date(), exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]), index: 2)
}
