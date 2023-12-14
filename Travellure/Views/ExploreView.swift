//
//  ExploreView.swift
//  Travellure
//
//  Created by veronica.gliga on 14.12.2023.
//

import SwiftUI

struct ExploreView: View {
    var destinations: [Destination] = SuggestionModel().destinations
    
    var body: some View {
        Text("Explore")
        VStack {
            List(DestinationCategory.allCases, id: \.self) { category in
                Section {
                    ForEach(destinations.filter { $0.category == category }) { item in
                        DestinationCellView()
                    }
                } header: {
                    Text(category.rawValue)
                }
            }
        }
    }
}

#Preview {
    ExploreView(destinations: SuggestionModel().destinations)
}
