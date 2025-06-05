//
//  Schedule.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation
import SwiftData

@Model
class Template: Identifiable {
    var id: UUID
    var title: String
    var descriptions: String
    @Relationship var exercises: [Exercise]

    init(
        id: UUID = UUID(),
        title: String,
        descriptions: String = "",
        exercises: [Exercise] = []
    ) {
        self.id = id
        self.title = title
        self.descriptions = descriptions
        self.exercises = exercises
    }
}

