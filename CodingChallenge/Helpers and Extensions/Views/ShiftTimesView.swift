//
//  ShiftTimesView.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 06/01/2023.
//

import SwiftUI

struct ShiftTimesView: View {

    let shift: Shift

    var body: some View {
        HStack {
            let isSameDay = shift.normalizedStartDateTime.isSameDay(as: shift.normalizedEndDateTime)
            let formatter: DateFormatter = isSameDay ? .hourOnlyFormatter : .shortDateFormatter
            Text(shift.normalizedStartDateTime, formatter: formatter)
            Spacer()
            Text(shift.normalizedEndDateTime, formatter: formatter)
        }
    }
}

