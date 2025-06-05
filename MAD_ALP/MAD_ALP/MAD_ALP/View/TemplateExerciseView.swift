//
//  TemplateExerciseView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI

struct TemplateExerciseView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var templateViewModel = TemplateViewModel()
    @State private var showAddSchedule = false
    @State private var selectedTemplate: Template? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Templates")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button(action: {
                        templateViewModel.fetchTemplates(context: modelContext)
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
                .padding()
                
                if templateViewModel.templates.isEmpty {
                    Spacer()
                    Text("No templates saved.")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(Array(templateViewModel.templates.enumerated()), id: \.element.id) { index, template in
                                TemplateCard(template: template, index: index)
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
            .onAppear {
                templateViewModel.fetchTemplates(context: modelContext)
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
}
