//
//  HomeView.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 09/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import SwiftUI

struct HomeView: View {
  @State private var model: HomeView.Model

  init(model: HomeView.Model) {
    self.model = model
  }

  var body: some View {
    VStack {
      HorizontalGradientScrollableView {
        ForEach(model.planetsSortedByDistance, id: \.name) { planet in
          NavigationLink(value: planet) {
            PlanetCardView(planet: planet)
              .padding(8)
          }
          .buttonStyle(.plain)
        }
      }
      .padding(.bottom, 16)

      VStack(spacing: 16) {
        PlanetDistanceGaugeView(
          headerText: "The distance between the Sun and Earth is",
          distanceText: model.distanceEarthFromSun
        )

        Button("Show me the distance") {
          withAnimation {
            model.showMeTheDistance()
          }
        }
        .buttonStyle(.borderedProminent)
        .font(.headline)
        .clipShape(.capsule)
      }
      .safeAreaPadding(.horizontal)
      Spacer()
    }
    .navigationTitle("Home")
    .navigationDestination(for: Planet.self) { planet in
      PlanetDetailsView(model: .init(planet: planet))
    }
  }
}

// MARK: - Previews

#Preview {
  NavigationStack {
    HomeView(model: .init(planets: .preview))
  }
}

#Preview("Scrollable Linear") {
  HorizontalGradientScrollableView {
    Text("Hello")
    Text("Hello")
    Text("Hello")
  }
}
