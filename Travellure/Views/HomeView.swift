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
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    
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
            
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color("Blue"),
                      _ inactiveTint: Color = .gray) -> some View {
        HStack(alignment: .bottom) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: tab,
                        animation: animation,
                        activeTab: $activeTab,
                        position: $tabShapePosition)
                .padding(.top, -27)
            }
        }
        
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background {
            Rectangle()
                .fill(Color("DarkBlue"))
                .ignoresSafeArea()
//                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
        }
        .padding(.top, -20)
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
    
}

#Preview {
    HomeView()
}

/// Tab Bar Item
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    /// Each Tab Item Position on the Screen
    @State private var tabPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                /// Increasing Size for the Active Tab
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(tint.gradient)
                            .frame(width: 70, height: 50)
                            .shadow(color: .black.opacity(0.6), radius: 5)
                            .rotationEffect(Angle(degrees: -5))
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.title)
                .font(.caption)
                .foregroundColor(activeTab == tab ? .white : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
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

