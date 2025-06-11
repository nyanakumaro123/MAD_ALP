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
    var targetsString: String
    var tipsString: String
    var imagesString: String
    
    @Relationship(inverse: \Schedule.exercises)
        var schedules: [Schedule] = []

    var targets: [String] {
        get { targetsString.isEmpty ? [] : targetsString.components(separatedBy: "|") }
        set { targetsString = newValue.joined(separator: "|") }
    }
    var tips: [String] {
        get { tipsString.isEmpty ? [] : tipsString.components(separatedBy: "|") }
        set { tipsString = newValue.joined(separator: "|") }
    }
    var images: [String] {
        get { imagesString.isEmpty ? [] : imagesString.components(separatedBy: "|") }
        set { imagesString = newValue.joined(separator: "|") }
    }

    init(id: UUID = UUID(), name: String, targets: [String] = [], tips: [String] = [], images: [String] = []) {
        self.id = id
        self.name = name
        self.targetsString = targets.joined(separator: "|")
        self.tipsString = tips.joined(separator: "|")
        self.imagesString = images.joined(separator: "|")
    }
}
