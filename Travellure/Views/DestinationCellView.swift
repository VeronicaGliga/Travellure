//
//  DestinationCellView.swift
//  Travellure
//
//  Created by veronica.gliga on 14.12.2023.
//

import SwiftUI

struct DestinationCellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("philippines")
                .resizable()
                .scaledToFit()
            RatingView(rating: testRating)
                .scaleEffect(0.7, anchor: .leading)
            Text("Philippines")
                .font(.title)
                .fontWeight(.bold)
            Text("Cebu, Blue Caves")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    DestinationCellView()
}
