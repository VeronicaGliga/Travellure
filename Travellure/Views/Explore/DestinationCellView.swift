//
//  DestinationCellView.swift
//  Travellure
//
//  Created by veronica.gliga on 14.12.2023.
//

import SwiftUI

struct DestinationCellView: View {
    var destination: Destination
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(destination.image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            RatingView(rating: testRating)
                .scaleEffect(0.7, anchor: .leading)
            Text(destination.country)
                .font(.title2)
                .fontWeight(.bold)
            Text(destination.city)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .shadow(radius: 10)
    }
}

#Preview {
    DestinationCellView(destination: testDetination)
}
