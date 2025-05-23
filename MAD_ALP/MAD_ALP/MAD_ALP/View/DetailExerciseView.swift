//
//  DetailExerciseView.swift
//  MAD_ALP
//
//  Created by student on 23/05/25.
//

import SwiftUI

struct DetailExerciseView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Text("Detail Exercise View")
                }
            }
            .navigationTitle(Text("Detail Exercise"))
        }
    }
}

#Preview {
    DetailExerciseView()
}
