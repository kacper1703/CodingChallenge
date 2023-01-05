//
//  ShiftsRequest.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import Foundation

struct ShiftsRequest: Encodable {
    enum RequestType: String {
        case week
        case fourday = "4day"
        case list
    }
}
