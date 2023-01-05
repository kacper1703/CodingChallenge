// Generated using Sourcery 1.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif
















class ShiftsNetworkServiceProtocolMock: ShiftsNetworkServiceProtocol {

    //MARK: - getShifts

    var getShiftsAddressTypeStartEndRadiusThrowableError: Error?
    var getShiftsAddressTypeStartEndRadiusCallsCount = 0
    var getShiftsAddressTypeStartEndRadiusCalled: Bool {
        return getShiftsAddressTypeStartEndRadiusCallsCount > 0
    }
    var getShiftsAddressTypeStartEndRadiusReceivedArguments: (address: String, type: ShiftsRequest.RequestType?, start: Date?, end: Date?, radius: Int?)?
    var getShiftsAddressTypeStartEndRadiusReceivedInvocations: [(address: String, type: ShiftsRequest.RequestType?, start: Date?, end: Date?, radius: Int?)] = []
    var getShiftsAddressTypeStartEndRadiusReturnValue: ShiftsResponse!
    var getShiftsAddressTypeStartEndRadiusClosure: ((String, ShiftsRequest.RequestType?, Date?, Date?, Int?) async throws -> ShiftsResponse)?

    func getShifts(address: String, type: ShiftsRequest.RequestType?, start: Date?, end: Date?, radius: Int?) async throws -> ShiftsResponse {
        if let error = getShiftsAddressTypeStartEndRadiusThrowableError {
            throw error
        }
        getShiftsAddressTypeStartEndRadiusCallsCount += 1
        getShiftsAddressTypeStartEndRadiusReceivedArguments = (address: address, type: type, start: start, end: end, radius: radius)
        getShiftsAddressTypeStartEndRadiusReceivedInvocations.append((address: address, type: type, start: start, end: end, radius: radius))
        if let getShiftsAddressTypeStartEndRadiusClosure = getShiftsAddressTypeStartEndRadiusClosure {
            return try await getShiftsAddressTypeStartEndRadiusClosure(address, type, start, end, radius)
        } else {
            return getShiftsAddressTypeStartEndRadiusReturnValue
        }
    }

}
