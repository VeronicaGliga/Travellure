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
//        ScrollView {
//            LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
//                ForEach(DestinationCategory.allCases, id: \.self) { category in
//                    Section {
////                        if category == .nearby {
//                            ScrollView(.horizontal, showsIndicators: false) {
//                                LazyHStack {
//                                    ForEach(destinations.filter { $0.category == category }) { destination in
//                                        DestinationCellView(destination: destination)
//                                            .frame(maxWidth: UIScreen.main.bounds.width - 50)
//                                    }
//                                }
//                                .padding()
//                            }
//                            .frame(height: 300)
////                        } else {
////                            LazyVStack(alignment: .leading, spacing: 30) {
////                                ForEach(destinations.filter { $0.category == category }) { destination in
////                                    DestinationCellView(destination: destination)
////                                }
////                            }
////                            .padding(10)
////                        }
//                    } header: {
//                        Text(category.rawValue)
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .padding(.leading)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .background {
//                                Color.white
//                            }
//                    }
//                    
//                }
//            }
//        }
        
        List(DestinationCategory.allCases, id: \.self) { category in
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(destinations.filter { $0.category == category }) { item in
                            DestinationCellView(destination: item)
                                .frame(maxWidth: UIScreen.main.bounds.width - 50, maxHeight: 300)
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                    }
                }
            } header: {
                Text(category.rawValue)
                    .fontWeight(.bold)
            }
        }
        .padding(-10)
        .listStyle(.grouped)
    }
}

#Preview {
    ExploreView(destinations: SuggestionModel().destinations)
}
