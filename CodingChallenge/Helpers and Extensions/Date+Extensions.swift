//
//  Date+Extensions.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import Foundation

extension Date {
    func isSameDay(as compareDate: Date) -> Bool {
        let calendar = Calendar.autoupdatingCurrent
        var components = calendar.dateComponents([.era, .year, .month, .day], from: self)
        let dateOne = calendar.date(from: components)

        components = calendar.dateComponents([.era, .year, .month, .day], from: compareDate)
        let dateTwo = calendar.date(from: components)

        return dateOne!.compare(dateTwo!) == .orderedSame
    }
}
