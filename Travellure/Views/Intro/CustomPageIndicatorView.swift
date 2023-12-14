//
//  CustomPageIndicatorView.swift
//  Travellure
//
//  Created by veronica.gliga on 21.03.2024.
//

import SwiftUI

struct CustomPageIndicatorView: View {
    // MARK: - Properties
    var totalPages: Int
    var currentPage: Int
    var activeTint: Color = .black
    var inactiveTint: Color = .gray.opacity(0.5)
    
    var body: some View {
        HStack {
            ForEach(0..<totalPages, id: \.self) {
                Circle()
                    .fill(currentPage == $0 ? activeTint : inactiveTint)
                    .frame(width: 4, height: 4)
            }
        }
    }
}

#Preview {
    CustomPageIndicatorView(totalPages: 3, currentPage: 1)
}
