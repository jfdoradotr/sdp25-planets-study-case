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
  @State private var distanceEarthFromSun: Int?

  private let planets: [Planet]

  init(planets: [Planet]) {
    self.planets = planets.sorted { $0.distanceFromSunKm > $1.distanceFromSunKm }
  }

  private var distanceEarthFromSunText: String? {
    guard let distanceEarthFromSun else { return nil }
    return "The distance is about \(distanceEarthFromSun.toKilometers)"
  }

  var body: some View {
    VStack {
      HorizontalGradientScrollableView {
        ForEach(planets, id: \.name) { planet in
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
          distanceText: distanceEarthFromSunText
        )

        Button("Show me the distance") {
          withAnimation {
            calculateDistance()
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

  private func calculateDistance() {
    let earth = planets.filter { planet in
      planet.name == "earth"
    }.first

    if let earth {
      distanceEarthFromSun = earth.distanceFromSunKm
    }
  }
}

// MARK: - Previews

#Preview {
  NavigationStack {
    HomeView(planets: .preview)
  }
}

#Preview("Scrollable Linear") {
  HorizontalGradientScrollableView {
    Text("Hello")
    Text("Hello")
    Text("Hello")
  }
}
