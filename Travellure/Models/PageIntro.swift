//
//  PageIntro.swift
//  Travellure
//
//  Created by veronica.gliga on 21.03.2024.
//

import Foundation

struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var imageName: String
    var title: String
    var subtitle: String
    var displayAction = false
}

var pageIntros: [PageIntro] = [
    .init(imageName: "Page1", title: "Intro Page 1", subtitle: "Thank you for choosing us, we can save your lovely time."),
    .init(imageName: "Page2", title: "Intro Page 2", subtitle: "Find your favorite destination and get inspired to fly away."),
    .init(imageName: "Page3", title: "Intro Page 3", subtitle: "Let's get started and register an account", displayAction: true)
]
