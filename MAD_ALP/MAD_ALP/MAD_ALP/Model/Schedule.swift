//
//  Schedule.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation
import SwiftData

@Model
class Schedule: Identifiable {
    var id: UUID
    var title: String
    var date: Date
    var time: Date
    var exercises: [Exercise]

    init(
        id: UUID = UUID(),
        title: String,
        date: Date,
        time: Date,
        exercises: [Exercise]
    ) {
        self.id = id
        self.title = title
        self.date = date
        self.time = time
        self.exercises = exercises
    }
}

