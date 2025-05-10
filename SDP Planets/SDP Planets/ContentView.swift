//
//  ContentView.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 05/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView {
        Tab("Home", systemImage: "house") {
          NavigationStack {
            HomeView(planets: .preview)
          }
        }
        Tab("Planets", systemImage: "list.bullet") {
          NavigationStack {
            PlanetsListView(planets: .preview)
          }
        }
        Tab("Info", systemImage: "info") {
          NavigationStack {
            SubscriptionFormView()
          }
        }
      }
    }
}

#Preview {
    ContentView()
}
