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
    
    var systemImage: String {
        switch self {
        case .explore:
            return "magnifyingglass.circle.fill"
        case .community:
            return "person.2.crop.square.stack.fill"
        case .navigation:
            return "map.circle"
        case .saved:
            return "square.and.arrow.down.on.square.fill"
        case .profile:
            return "person.crop.circle.fill"
        }
    }
}

/// Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}
