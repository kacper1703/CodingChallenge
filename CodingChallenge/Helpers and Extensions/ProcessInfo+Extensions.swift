//
//  ProcessInfo+Extensions.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import Foundation

var isRunningForPreviews: Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
