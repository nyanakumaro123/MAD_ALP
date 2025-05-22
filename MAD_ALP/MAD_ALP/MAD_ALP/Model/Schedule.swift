//
//  Schedule.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation

struct Schedule: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let date: Date
    let time: String // Change this into time format
    let exercises: [Exercise]
}
