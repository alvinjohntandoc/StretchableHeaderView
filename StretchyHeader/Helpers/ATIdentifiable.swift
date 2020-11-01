//
//  Identifiable.swift
//  StretchyHeader
//
//  Created by Alvin John Tandoc on 11/1/20.
//  Copyright © 2020 Alvin John Tandoc. All rights reserved.
//

import Foundation

import Foundation

protocol ATIdentifiable {
    
    /// Identifer
    static var identifier: String { get }
}

extension ATIdentifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}

