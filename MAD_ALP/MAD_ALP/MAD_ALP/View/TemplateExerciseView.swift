//
//  TemplateExerciseView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI

struct TemplateExerciseView: View {

    @EnvironmentObject var templateViewModel: TemplateViewModel
    

    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @State private var showConfirmation = false
    @State private var confirmationMessage = ""
    @State private var showAddSchedule = false
    @State private var selectedTemplate: Template? = nil

    // Hardcoded templates
    let templates: [Template] = [
        Template(title: "Full Body Beginner", descriptions: "A balanced routine for beginners targeting all major muscle groups.", exercises: [
            Exercise(name: "Push Ups", targets: ["Chest", "Triceps", "Shoulders", "Core"], tips: ["Keep your back straight", "Lower yourself slowly"], image1: [], image2: []),
            Exercise(name: "Squats", targets: ["Quads", "Hamstrings", "Glutes", "Lower Back", "Core"], tips: ["Feet shoulder-width apart", "Keep your knees behind toes"], image1: [], image2: []),
            Exercise(name: "Pull Ups", targets: ["Back", "Biceps", "Shoulders"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: [], image2: [])
        ]),
        Template(title: "Upper Body Strength", descriptions: "Great for building chest, shoulders, and arms.", exercises: [
            Exercise(name: "Bench Press", targets: ["Chest", "Shoulders", "Triceps"], tips: ["Keep your core tight", "Don't let your hips sag"], image1: [], image2: []),
            Exercise(name: "Dips", targets: ["Chest", "Triceps", "Shoulders"], tips: ["Keep your elbows close", "Lower yourself slowly"], image1: [], image2: []),
            Exercise(name: "Dumbbell Rows", targets: ["Back", "Biceps", "Forearms"], tips: ["Pull with your elbow", "Keep your back straight"], image1: [], image2: [])
        ]),
        Template(title: "Lower Body Focus", descriptions: "Targets legs, glutes, and core — ideal for strengthening your lower half.", exercises: [
            Exercise(name: "Lunges", targets: ["Quads", "Glutes", "Hamstrings", "Calves", "Core"], tips: ["Keep your core tight", "Don't let your knee go past your toes"], image1: [], image2: []),
            Exercise(name: "Squats", targets: ["Quads", "Hamstrings", "Glutes", "Lower Back", "Core"], tips: ["Feet shoulder-width apart", "Keep your knees behind toes"], image1: [], image2: [])
        ]),
        Template(title: "Core Crusher", descriptions: "A quick core workout for abs and stability.", exercises: [
            Exercise(name: "Plank", targets: ["Core", "Shoulders"], tips: ["Keep your body straight", "Don't let your hips sag"], image1: [], image2: []),
            Exercise(name: "Russian Twists", targets: ["Obliques", "Core"], tips: ["Twist from your waist", "Keep your feet off the ground"], image1: [], image2: []),
            Exercise(name: "Leg Raises", targets: ["Lower Abs", "Core"], tips: ["Keep your legs straight", "Don't arch your back"], image1: [], image2: [])
        ]),
        Template(title: "Quick Cardio Blast", descriptions: "A fast-paced routine to get your heart rate up.", exercises: [
            Exercise(name: "Jumping Jacks", targets: ["Full Body"], tips: ["Land softly", "Keep your arms straight"], image1: [], image2: []),
            Exercise(name: "Mountain Climbers", targets: ["Core", "Shoulders", "Legs"], tips: ["Keep your hips low", "Move quickly"], image1: [], image2: []),
            Exercise(name: "Burpees", targets: ["Full Body"], tips: ["Explode up", "Land softly"], image1: [], image2: [])
        ])
    ]


    var body: some View {
        VStack {
            Text("Template Exercise")
                .font(.system(size: 36, weight: .bold))
                .fontWeight(.bold)
                .padding(.bottom, 28)
            
            if templates.isEmpty {
                VStack {
                    Spacer()
                    Text("No templates available.")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                }
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(Array(templates.enumerated()), id: \.element.id) { index, template in
                            TemplateCard(template: template, index: index)
                                .scaleEffect(selectedTemplate?.id == template.id ? 1.05 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: selectedTemplate?.id)
                                .onLongPressGesture(minimumDuration: 0.0, maximumDistance: .infinity) { pressing in
                                    selectedTemplate = pressing ? template : nil
                                } perform: { }
                                .onTapGesture {
                                    selectedTemplate = template
                                    showAddSchedule = true
                                }
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
        .alert("Template Added", isPresented: $showConfirmation) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(confirmationMessage)
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
                .environmentObject(scheduleViewModel)
                .environmentObject(exerciseViewModel)
            }
        }
    }
}

#Preview {
    TemplateExerciseView()

        .environmentObject(TemplateViewModel())

        .environmentObject(ScheduleViewModel())

}
