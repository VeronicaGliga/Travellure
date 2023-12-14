//
//  DestinationCategory.swift
//  Travellure
//
//  Created by veronica.gliga on 14.12.2023.
//

import Foundation

enum DestinationCategory: String, Codable, CaseIterable {
    case nearby = "Top destinations nearby"
    case views = "Best views nearby"
    case activity = "Browse by activity"
    case cityBreak = "City break"
    case season = "Top destinations by season"
}
