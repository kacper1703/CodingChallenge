//
//  Array+Extensions.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import Foundation

extension Array {
    public init(count: Int, elementCreator: (Int) -> Element) {
        self = (0 ..< count).map { id in elementCreator(id) }
    }
}
