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
    var targets: [String] = []
    var tips: [String] = []
    var image1: [String] = []
    var image2: [String] = []
    
    @Relationship(inverse: \Schedule.exercises)
    var schedules: [Schedule] = []

    init(id: UUID = UUID(), name: String, targets: [String] = [], tips: [String] = [], image1: [String]? = nil, image2: [String]? = nil) {
        self.id = id
        self.name = name
        self.targets = targets
        self.tips = tips
        self.image1 = image1 ?? []
        self.image2 = image2 ?? []
    }
    
    var getImage1: [String] {
        get {
            return image1
        }
    }
    
    var getImage2: [String] {
        get {
            return image2
        }
    }
}
