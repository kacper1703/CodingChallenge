//
//  ColorIndicatorText.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 06/01/2023.
//

import SwiftUI

struct ColorIndicatorText: View {

    let color: Color
    let text: String

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 3)
                .foregroundColor(color)
                .frame(width: 5)
            Text(text)
            Spacer()
        }
    }

    init(color: Color, text: String) {
        self.color = color
        self.text = text
    }

    init(_ specialty: LocalizedSpecialty) {
        self.color = Color(specialty.specialty.color.uiColor)
        self.text = specialty.name
    }

    init(_ skill: SkillType) {
        self.color = Color(skill.color.uiColor)
        self.text = skill.name
    }

    init(_ facilityType: FacilityType) {
        self.color = Color(facilityType.color.uiColor)
        self.text = facilityType.name
    }
}
