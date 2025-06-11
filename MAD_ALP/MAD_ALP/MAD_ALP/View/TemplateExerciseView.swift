//
//  TemplateExerciseView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI

struct TemplateExerciseView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @State private var showConfirmation = false
    @State private var confirmationMessage = ""
    @State private var showAddSchedule = false
    @State private var selectedTemplate: Template? = nil

    // Hardcoded templates
    let templates: [Template] = [
        Template(title: "Full Body Beginner", descriptions: "A balanced routine for beginners targeting all major muscle groups.", exercises: [
            Exercise(name: "Push Ups", targets: ["Chest", "Triceps", "Shoulders", "Core"], tips: ["Keep your back straight", "Lower yourself slowly"], images: []),
            Exercise(name: "Squats", targets: ["Quads", "Hamstrings", "Glutes", "Lower Back", "Core"], tips: ["Feet shoulder-width apart", "Keep your knees behind toes"], images: []),
            Exercise(name: "Pull Ups", targets: ["Back", "Biceps", "Shoulders"], tips: ["Keep your core tight", "Don't let your hips sag"], images: [])
        ]),
        Template(title: "Upper Body Strength", descriptions: "Great for building chest, shoulders, and arms.", exercises: [
            Exercise(name: "Bench Press", targets: ["Chest", "Shoulders", "Triceps"], tips: ["Keep your core tight", "Don't let your hips sag"], images: []),
            Exercise(name: "Dips", targets: ["Chest", "Triceps", "Shoulders"], tips: ["Keep your elbows close", "Lower yourself slowly"], images: []),
            Exercise(name: "Dumbbell Rows", targets: ["Back", "Biceps", "Forearms"], tips: ["Pull with your elbow", "Keep your back straight"], images: [])
        ]),
        Template(title: "Lower Body Focus", descriptions: "Targets legs, glutes, and core — ideal for strengthening your lower half.", exercises: [
            Exercise(name: "Lunges", targets: ["Quads", "Glutes", "Hamstrings", "Calves", "Core"], tips: ["Keep your core tight", "Don't let your knee go past your toes"], images: []),
            Exercise(name: "Squats", targets: ["Quads", "Hamstrings", "Glutes", "Lower Back", "Core"], tips: ["Feet shoulder-width apart", "Keep your knees behind toes"], images: [])
        ]),
        Template(title: "Core Crusher", descriptions: "A quick core workout for abs and stability.", exercises: [
            Exercise(name: "Plank", targets: ["Core", "Shoulders"], tips: ["Keep your body straight", "Don't let your hips sag"], images: []),
            Exercise(name: "Russian Twists", targets: ["Obliques", "Core"], tips: ["Twist from your waist", "Keep your feet off the ground"], images: []),
            Exercise(name: "Leg Raises", targets: ["Lower Abs", "Core"], tips: ["Keep your legs straight", "Don't arch your back"], images: [])
        ]),
        Template(title: "Quick Cardio Blast", descriptions: "A fast-paced routine to get your heart rate up.", exercises: [
            Exercise(name: "Jumping Jacks", targets: ["Full Body"], tips: ["Land softly", "Keep your arms straight"], images: []),
            Exercise(name: "Mountain Climbers", targets: ["Core", "Shoulders", "Legs"], tips: ["Keep your hips low", "Move quickly"], images: []),
            Exercise(name: "Burpees", targets: ["Full Body"], tips: ["Explode up", "Land softly"], images: [])
        ])
    ]

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Templates")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
                
                if templates.isEmpty {
                    Spacer()
                    Text("No templates available.")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(Array(templates.enumerated()), id: \.element.id) { index, template in
                                VStack(spacing: 8) {
                                    TemplateCard(template: template, index: index)
                                    Button(action: {
                                        // Add to schedule for today, current time
                                        let now = Date()
                                        let calendar = Calendar.current
                                        let today = calendar.startOfDay(for: now)
                                        let defaultTime = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: today) ?? now
                                        scheduleViewModel.addSchedule(
                                            title: template.title,
                                            date: today,
                                            time: defaultTime,
                                            exercises: template.exercises,
                                            context: modelContext
                                        )
                                        confirmationMessage = "Added '\(template.title)' to your schedule for today!"
                                        showConfirmation = true
                                    }) {
                                        Text("Add to Schedule")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 16)
                                            .background(Color.blue)
                                            .cornerRadius(8)
                                    }
                                }
                                .padding(.bottom, 8)
                            }
                        }
                        .padding()
                    }
                }
            }
            .alert(isPresented: $showConfirmation) {
                Alert(title: Text("Template Added"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
            }
            .sheet(isPresented: $showAddSchedule) {
                if let template = selectedTemplate {
                    AddScheduleView(
                        title: template.title,
                        selectedDate: Date(),
                        time: Date(),
                        selectedExercises: template.exercises
                    )
                    .environment(\.modelContext, modelContext)
                }
            }
        }
    }
}

#Preview {
    TemplateExerciseView()
        .environmentObject(ScheduleViewModel())
}
