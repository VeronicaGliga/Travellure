//
//  TabModel.swift
//  Travellure
//
//  Created by veronica.gliga on 19.01.2024.
//

import Foundation

/// Tab's
enum Tab: String, CaseIterable {
    case explore = "magnifyingglass.circle.fill"
    case community = "person.2.crop.square.stack.fill"
    case navigation = "map.circle"
    case saved = "square.and.arrow.down.on.square.fill"
    case profile = "person.crop.circle.fill"
    
    var title: String {
        switch self {
        case .explore:
            return "Explore"
        case .community:
            return "Community"
        case .navigation:
            return "Navigation"
        case .saved:
            return "Saved"
        case .profile:
            return "Profile"
        }
    }
}

/// Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}
