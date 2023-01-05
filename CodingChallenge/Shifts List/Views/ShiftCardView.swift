//
//  ShiftCardView.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import SFSafeSymbols
import SwiftUI

struct ShiftCardView: View {

    let shift: Shift

    var body: some View {
        content
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(radius: 3)
            )
    }

    @ViewBuilder
    private var content: some View {
        VStack(spacing: 8) {
            ColorIndicatorText(shift.facilityType)
                .fixedSize(horizontal: false, vertical: true)
            ColorIndicatorText(shift.skill)
                .fixedSize(horizontal: false, vertical: true)

            ShiftTimesView(shift: shift)
            .foregroundColor(.gray)

            if shift.premiumRate || shift.covid {
                HStack {
                    if shift.premiumRate {
                        Image(systemSymbol: .dollarsignCircleFill)
                            .foregroundColor(.green)
                    }
                    if shift.covid {
                        Text("🦠")
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ShiftCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ShiftCardView(shift: .stub(covid: true, premiumRate: true))
                .padding()
            ShiftCardView(shift: .stub(covid: false, premiumRate: false))
                .padding()
        }
    }
}
