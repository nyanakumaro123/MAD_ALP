//
//  ExerciseGroup.swift
//  MAD_ALP
//
//  Created by student on 23/05/25.
//

import Foundation
import SwiftData

//@Model
struct ExerciseGroup: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var exercises: [Exercise]
}
