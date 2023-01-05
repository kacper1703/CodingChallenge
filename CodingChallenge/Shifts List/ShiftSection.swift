//
//  ShiftSection.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 06/01/2023.
//

import Foundation

struct ShiftSection: Identifiable {

    let id = UUID()
    let date: Date
    let shifts: [Shift]

    init(date: Date, shifts: [Shift]) {
        self.date = date
        self.shifts = shifts
    }
}
