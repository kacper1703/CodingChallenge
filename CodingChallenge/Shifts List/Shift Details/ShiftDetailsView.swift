//
//  ShiftDetailsView.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import SFSafeSymbols
import SwiftUI

struct ShiftDetailsView: View {

    let shift: Shift

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ColorIndicatorText(shift.skill)
                    .font(.headline)

                ColorIndicatorText(shift.localizedSpecialty)
                    .font(.headline)

                ColorIndicatorText(shift.facilityType)
                    .font(.subheadline)

                Text(shift.shiftKind.rawValue)
                    .font(.footnote)

                ShiftTimesView(shift: shift)
                .font(.callout)
                .foregroundColor(.gray)
                .padding(.vertical, 8)

                if shift.premiumRate {
                    Label("Premium rate", systemSymbol: SFSymbol.dollarsignCircleFill)
                }
                if shift.covid {
                    Text("🦠 COVID hospital")
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Close") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct ShiftDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShiftDetailsView(shift: .stub(covid: true,
                                          facilityType: .stub(color: .dummy(),
                                                              name: "Facility"),
                                          localizedSpecialty: .stub(name: "Specialty"),
                                          normalizedEndDateTime: .init(timeIntervalSinceNow: 5000),
                                          normalizedStartDateTime: .init(timeIntervalSinceNow: 2000),
                                          premiumRate: true,
                                          shiftID: 12345,
                                          shiftKind: .dayShift,
                                          skill: .stub(color: .dummy(), name: "Skill"),
                                          startTime: .init(),
                                          endTime: .init(),
                                          timezone: .central))
        }
    }
}
