//
//  Tempoary.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation
import SwiftData

@Model
class Exercise: Identifiable {
    var id: UUID
    var name: String
    var targets: [String]
    var tips: [String]
    @Relationship(inverse: \Schedule.exercises)
        var schedules: [Schedule] = []
    
    init(id: UUID = UUID(), name: String, tips: [String] = []) {
        self.targets = targets
        self.tips = tips
        self.images = images
        
    }
}
