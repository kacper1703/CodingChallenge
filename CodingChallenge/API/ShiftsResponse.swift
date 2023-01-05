//
//  ShiftsResponse.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//
import Foundation

// sourcery: AutoStub
struct ShiftsResponse: Decodable {
    let data: [Datum]
}

// sourcery: AutoStub
struct Datum: Decodable {

    enum CodingKeys: CodingKey {
        case date
        case shifts
    }

    let date: Date
    let shifts: [Shift]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateString = try container.decode(String.self, forKey: .date)

        if let date = DateFormatter.dayOnly.date(from: dateString) {
            self.date = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .date,
                                                   in: container,
                                                   debugDescription: "Date string does not match format expected by formatter.")
        }

        self.shifts = try container.decode([Shift].self, forKey: .shifts)
    }

    init(date: Date, shifts: [Shift]) {
        self.date = date
        self.shifts = shifts
    }
}

// sourcery: AutoStub
struct Shift: Decodable, Identifiable {

    enum CodingKeys: String, CodingKey {
        case covid
        case endTime = "end_time"
        case facilityType = "facility_type"
        case localizedSpecialty = "localized_specialty"
        case normalizedEndDateTime = "normalized_end_date_time"
        case normalizedStartDateTime = "normalized_start_date_time"
        case premiumRate = "premium_rate"
        case shiftID = "shift_id"
        case shiftKind = "shift_kind"
        case skill
        case startTime = "start_time"
        case timezone
    }

    let covid: Bool
    let facilityType: FacilityType
    let localizedSpecialty: LocalizedSpecialty
    let normalizedEndDateTime: Date
    let normalizedStartDateTime: Date
    let premiumRate: Bool
    let shiftID: Int
    let shiftKind: ShiftKind // sourcery: defaultizeEnum
    let skill: SkillType // sourcery: defaultizeEnum
    let startTime: Date
    let endTime: Date
    let timezone: Timezone // sourcery: defaultizeEnum

    var id: Int { shiftID }

    internal init(covid: Bool,
                  facilityType: FacilityType,
                  localizedSpecialty: LocalizedSpecialty,
                  normalizedEndDateTime: Date,
                  normalizedStartDateTime: Date,
                  premiumRate: Bool,
                  shiftID: Int,
                  shiftKind: ShiftKind,
                  skill: SkillType,
                  startTime: Date,
                  endTime: Date,
                  timezone: Timezone) {
        self.covid = covid
        self.facilityType = facilityType
        self.localizedSpecialty = localizedSpecialty
        self.normalizedEndDateTime = normalizedEndDateTime
        self.normalizedStartDateTime = normalizedStartDateTime
        self.premiumRate = premiumRate
        self.shiftID = shiftID
        self.shiftKind = shiftKind
        self.skill = skill
        self.startTime = startTime
        self.endTime = endTime
        self.timezone = timezone
    }

    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Shift.CodingKeys> = try decoder.container(keyedBy: Shift.CodingKeys.self)

        covid = try container.decode(Bool.self, forKey: Shift.CodingKeys.covid)
        endTime = try container.decode(Date.self, forKey: Shift.CodingKeys.endTime)
        facilityType = try container.decode(FacilityType.self, forKey: Shift.CodingKeys.facilityType)
        localizedSpecialty = try container.decode(LocalizedSpecialty.self, forKey: Shift.CodingKeys.localizedSpecialty)

        let normalizedEndDateTimeString = try container.decode(String.self, forKey: Shift.CodingKeys.normalizedEndDateTime)
        if let normalizedEndDateTime = DateFormatter.normalized.date(from: normalizedEndDateTimeString) {
            self.normalizedEndDateTime = normalizedEndDateTime
        } else {
            throw DecodingError.dataCorruptedError(forKey: .normalizedEndDateTime,
                                                   in: container,
                                                   debugDescription: "Date string does not match format expected by formatter.")
        }

        let normalizedStartDateTimeString = try container.decode(String.self, forKey: Shift.CodingKeys.normalizedStartDateTime)

        if let normalizedStartDateTime = DateFormatter.normalized.date(from: normalizedStartDateTimeString) {
            self.normalizedStartDateTime = normalizedStartDateTime
        } else {
            throw DecodingError.dataCorruptedError(forKey: .normalizedEndDateTime,
                                                   in: container,
                                                   debugDescription: "Date string does not match format expected by formatter.")
        }

        premiumRate = try container.decode(Bool.self, forKey: Shift.CodingKeys.premiumRate)
        shiftID = try container.decode(Int.self, forKey: Shift.CodingKeys.shiftID)
        shiftKind = try container.decode(ShiftKind.self, forKey: Shift.CodingKeys.shiftKind)
        skill = try container.decode(SkillType.self, forKey: Shift.CodingKeys.skill)
        startTime = try container.decode(Date.self, forKey: Shift.CodingKeys.startTime)
        timezone = try container.decode(Timezone.self, forKey: Shift.CodingKeys.timezone)
    }
}

// sourcery: AutoStub
struct FacilityType: Decodable {
    let color: HexColor
    let id: Int
    let name: String
}

// sourcery: AutoStub
struct SkillType: Decodable {
    let color: HexColor
    let id: Int
    let name: String
}

// sourcery: AutoStub
struct LocalizedSpecialty: Decodable {

    enum CodingKeys: String, CodingKey {
        case abbreviation
        case id
        case name
        case specialty
        case specialtyID = "specialty_id"
        case stateID = "state_id"
    }

    let abbreviation: String
    let id: Int
    let name: String
    let specialty: FacilityType
    let specialtyID: Int
    let stateID: Int
}

enum ShiftKind: String, Decodable {
    case dayShift = "Day Shift"
    case eveningShift = "Evening Shift"
    case nightShift = "Night Shift"
}

enum Timezone: String, Decodable {
    case central = "Central"
    case eastern = "Eastern"
    case mountain = "Mountain"
    case pacific = "Pacific"
}
