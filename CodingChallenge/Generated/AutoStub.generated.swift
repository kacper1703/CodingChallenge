// Generated using Sourcery 1.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all
import Foundation
import UIKit

extension Datum {
	static func stub(date: Date = .dummy(), shifts: [Shift] = []) -> Datum {
		return Datum(date: date, shifts: shifts)
	}

    static func dummy() -> Datum {
        return Datum.stub()
    }
}
extension FacilityType {
	static func stub(color: HexColor = .dummy(), id: Int = .dummy(), name: String = .dummy()) -> FacilityType {
		return FacilityType(color: color, id: id, name: name)
	}

    static func dummy() -> FacilityType {
        return FacilityType.stub()
    }
}
extension HexColor {
	static func stub(uiColor: UIColor = .dummy()) -> HexColor {
		return HexColor(uiColor: uiColor)
	}

    static func dummy() -> HexColor {
        return HexColor.stub()
    }
}
extension LocalizedSpecialty {
	static func stub(abbreviation: String = .dummy(), id: Int = .dummy(), name: String = .dummy(), specialty: FacilityType = .dummy(), specialtyID: Int = .dummy(), stateID: Int = .dummy()) -> LocalizedSpecialty {
		return LocalizedSpecialty(abbreviation: abbreviation, id: id, name: name, specialty: specialty, specialtyID: specialtyID, stateID: stateID)
	}

    static func dummy() -> LocalizedSpecialty {
        return LocalizedSpecialty.stub()
    }
}
extension Shift {
	static func stub(covid: Bool = .dummy(), facilityType: FacilityType = .dummy(), localizedSpecialty: LocalizedSpecialty = .dummy(), normalizedEndDateTime: Date = .dummy(), normalizedStartDateTime: Date = .dummy(), premiumRate: Bool = .dummy(), shiftID: Int = .dummy(), shiftKind: ShiftKind = .dayShift, skill: SkillType = .dummy(), startTime: Date = .dummy(), endTime: Date = .dummy(), timezone: Timezone = .central) -> Shift {
		return Shift(covid: covid, facilityType: facilityType, localizedSpecialty: localizedSpecialty, normalizedEndDateTime: normalizedEndDateTime, normalizedStartDateTime: normalizedStartDateTime, premiumRate: premiumRate, shiftID: shiftID, shiftKind: shiftKind, skill: skill, startTime: startTime, endTime: endTime, timezone: timezone)
	}

    static func dummy() -> Shift {
        return Shift.stub()
    }
}
extension ShiftsResponse {
	static func stub(data: [Datum] = []) -> ShiftsResponse {
		return ShiftsResponse(data: data)
	}

    static func dummy() -> ShiftsResponse {
        return ShiftsResponse.stub()
    }
}
extension SkillType {
	static func stub(color: HexColor = .dummy(), id: Int = .dummy(), name: String = .dummy()) -> SkillType {
		return SkillType(color: color, id: id, name: name)
	}

    static func dummy() -> SkillType {
        return SkillType.stub()
    }
}

extension Bool {
    static func dummy() -> Bool {
        false
    }
}

extension URL {
    static func dummy() -> URL {
        URL(string: "www.google.com")!
    }
}

extension StringProtocol {
    static func dummy() -> Self {
        "Default text"
    }
}

extension String {
    static func random() -> String {
        UUID().uuidString
    }
}

extension ExpressibleByIntegerLiteral {
    static func dummy() -> Self {
        234023
    }
}

extension Optional {
    static func dummy() -> Self {
        nil
    }
}

extension UUID {
    static func dummy() -> Self {
        UUID()
    }
}

extension UIImage {
    static func dummy() -> UIImage {
        UIImage()
    }
}

extension CGSize {
    static func dummy() -> Self {
        .zero
    }
}

extension Date {
    static func dummy() -> Self {
        .init()
    }
}

extension UIColor {
    static func dummy() -> UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
// swiftlint:enable all
