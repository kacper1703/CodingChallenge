//
//  ShiftsNetworkService.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import Alamofire
import Foundation

// sourcery: AutoMockable
protocol ShiftsNetworkServiceProtocol {
    func getShifts(address: String,
                   type: ShiftsRequest.RequestType?,
                   start: Date?,
                   end: Date?,
                   radius: Int?) async throws -> ShiftsResponse
}

extension ShiftsNetworkServiceProtocol {
    func getShifts(address: String,
                   type: ShiftsRequest.RequestType? = nil,
                   start: Date? = nil,
                   end: Date? = nil,
                   radius: Int? = nil) async throws -> ShiftsResponse {
        try await getShifts(address: address, type: type, start: start, end: end, radius: radius)
    }
}

struct ShiftsNetworkService: ShiftsNetworkServiceProtocol {
    func getShifts(address: String,
                   type: ShiftsRequest.RequestType?,
                   start: Date?,
                   end: Date?,
                   radius: Int?) async throws -> ShiftsResponse {
        var queryParameters: Parameters = ["address": address]
        if let type {
            queryParameters["type"] = type.rawValue
        }
        if let start {
            queryParameters["start"] = ISO8601DateFormatter.string(from: start, timeZone: .current)
        }
        if let end {
            queryParameters["end"] = ISO8601DateFormatter.string(from: end, timeZone: .current)
        }
        if let radius {
            queryParameters["radius"] = String(radius)
        }

        let request = AF.request(
            "https://staging-app.shiftkey.com/api/v2/available_shifts", // usually should be stored in a safer, encrypted place...
            method: .get,
            parameters: queryParameters,
            headers: ["Content-Type": "application/json",
                      "Accept": "application/json"]
        )

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return try await request.serializingDecodable(ShiftsResponse.self,
                                                      decoder: decoder).value
    }
}
