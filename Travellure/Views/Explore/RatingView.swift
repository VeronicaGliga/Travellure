//
//  RatingView.swift
//  Travellure
//
//  Created by veronica.gliga on 14.12.2023.
//

import SwiftUI

struct RatingView: View {
    var rating: Rating
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(rating.score.removeZerosFromEnd()) (\(rating.votes))")
                .foregroundStyle(.gray)
                .padding(.bottom, 2)
            HStack {
                ForEach(1...6, id: \.self){ star in
                    Image(systemName: (star <= rating.stars) ? "star.fill" : "star")
                }
            }
            
        }
    }
}

#Preview {
    RatingView(rating: Rating(stars: 4, score: 4.5, votes: 1000))
}
