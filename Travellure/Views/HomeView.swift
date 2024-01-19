//
//  ContentView.swift
//  Travellure
//
//  Created by veronica.gliga on 12.12.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    @State private var activeTab: Tab = .explore
    
    var body: some View {
        
        VStack {
            TabView(selection: $activeTab){
                ExploreView(destinations: SuggestionModel().destinations)
                    .setUpTab(.explore)
                CommunityView()
                    .setUpTab(.community)
                MapView()
                    .setUpTab(.navigation)
                SavedItemsView()
                    .setUpTab(.saved)
                ProfileView()
                    .setUpTab(.profile)
            }
            .tint(.tabBarTint)
            
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(.bounce.down.byLayer, value: animatedTab.isAnimating)
                    
                    Text(tab.title)
                        .font(.caption)
                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.primary : Color.gray.opacity(0.8))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    }, completion: {
                        var trasnaction = Transaction()
                        trasnaction.disablesAnimations = true
                        withTransaction(trasnaction) {
                            animatedTab.isAnimating = nil
                        }
                    })
                }
            }
        }
        .background(.bar)
    }
}

#Preview {
    HomeView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
