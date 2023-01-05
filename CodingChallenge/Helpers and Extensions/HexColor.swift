//
//  HexColor.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import UIKit

// sourcery: AutoStub
struct HexColor: Decodable, Equatable {
    let uiColor: UIColor

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)

        if let uiColor = UIColor(hex: string) {
            self.uiColor = uiColor
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Cannot initialize HexColor from `\(string)`")
        }
    }

    init(uiColor: UIColor) {
        self.uiColor = uiColor
    }
}

private extension UIColor {
    convenience init?(hex: String) {
        let hex: String = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        guard Scanner(string: hex).scanHexInt64(&int) else {
            return nil
        }

        switch hex.count {
            case 6:
                self.init(red: CGFloat((int & 0xFF0000) >> 16) / 255.0,
                          green: CGFloat((int & 0x00FF00) >> 8) / 255.0,
                          blue: CGFloat(int & 0x0000FF) / 255.0,
                          alpha: CGFloat(1.0))
            case 8:
                self.init(red: CGFloat((int & 0xff000000) >> 24) / 255,
                          green: CGFloat((int & 0x00ff0000) >> 16) / 255,
                          blue: CGFloat((int & 0x0000ff00) >> 8) / 255,
                          alpha: CGFloat(int & 0x000000ff) / 255)
            default:
                return nil
        }
    }
}
