//
//  ContentView.swift
//  Travellure
//
//  Created by veronica.gliga on 12.12.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    VStack {
                        Text("Explore")
                        Image(systemName: "magnifyingglass.circle.fill")
                    }
                }
            CommunityView()
                .tabItem {
                    VStack {
                        Text("Community")
                        Image(systemName: "person.2.circle.fill")
                    }
                }
            MapView()
                .tabItem {
                    VStack {
                        Text("Navigation")
                        Image(systemName: "map.circle")
                    }
                }
            SavedItemsView()
                .tabItem {
                    VStack {
                        Text("Saved")
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                    }
                }
            ProfileView()
                .tabItem {
                    VStack {
                        Text("Profile")
                        Image(systemName: "person.crop.circle.fill")
                    }
                }
        }
        .tint(.tabBarTint)
    }
}

#Preview {
    HomeView()
}
