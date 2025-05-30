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
    var tips: [String]
    var images: [String]

    init(id: UUID = UUID(), name: String, tips: [String] = [], images: [String] = []) {
        self.id = id
        self.name = name
        self.tips = tips
        self.images = images
    }
}
