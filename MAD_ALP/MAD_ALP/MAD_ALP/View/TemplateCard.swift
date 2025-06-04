//
//  ScheduleCard.swift
//  MAD_ALP
//
//  Created by student on 30/05/25.
//

import SwiftUI
import _SwiftData_SwiftUI

struct TemplateCard: View {
    var template: Template
    var index: Int

    @State private var showEdit = false
    
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
        VStack(alignment: .leading) {
            Text("\(template.title)")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(textColorr)
                .padding(.bottom, 4)
            
            Text("\(template.descriptions)")
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundStyle(textColorr)
                .padding(.bottom, 8)
            
            // scrollabe square exercise text name
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(template.exercises, id: \.id) { exercise in
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
        .onTapGesture {
            showEdit = true
        }
        .padding(20)
        .background(backgroundColor)
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(12)
        .contentShape(Rectangle()) // Ensures whole card is tappable
        .fullScreenCover(isPresented: $showEdit) {
            AddScheduleView(
                id: template.id,
                title: template.title,
                selectedDate: Date(),
                time: Date(),
                selectedExercises: template.exercises
            )
        }
        
    }
}

#Preview {
    TemplateCard(template: Template(title: "Template Title Name", descriptions: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]), index: 0)
    TemplateCard(template: Template(title: "Template Title Name", descriptions: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]), index: 1)
    TemplateCard(template: Template(title: "Template Title Name", descriptions: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", exercises: [Exercise(name: "Push Up", tips: ["Keep back straight"]), Exercise(name: "Squat", tips: ["Bend knees", "Keep balance"])]), index: 2)
}
