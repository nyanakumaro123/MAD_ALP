//
//  TemplateExerciseView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI

struct TemplateExerciseView: View {
    @EnvironmentObject var templateViewModel: TemplateViewModel
    
    var body: some View {
        VStack {
            Text("Template Exercise")
                .font(.title)
                .fontWeight(.bold)
            
            if (templateViewModel.templates.isEmpty) {
                VStack {
                    Spacer()
                    Text("No template available")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(Array(templateViewModel.templates.enumerated()), id: \.element.id) { index, template in
                            TemplateCard(template: template, index: index)
                        }

                    }
                }
            }
            
        }
        .padding()
        
    }
}

#Preview {
    TemplateExerciseView()
        .environmentObject(TemplateViewModel())
}
