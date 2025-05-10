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
  @State private var distance: Int = 0
  @State private var isGaugeFilled: Bool = false

  private let planets: [Planet]

  init(planets: [Planet]) {
    self.planets = planets.sorted { $0.distanceFromSunKm > $1.distanceFromSunKm }
  }

  private var highestDistance: Int {
    planets.sorted { $0.distanceFromSunKm < $1.distanceFromSunKm }.last?.distanceFromSunKm ?? 0
  }

  var body: some View {
    VStack {
      ScrollView(.horizontal) {
        HStack {
          ForEach(planets, id: \.name) { planet in
            NavigationLink(value: planet) {
              PlanetCardView(planet: planet)
                .padding(8)
            }
            .buttonStyle(PlainButtonStyle())
          }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
      }
      .scrollIndicators(.hidden)
      .frame(height: 200)
      .background(LinearGradient(colors: [.blue, .purple, .red, .orange, .yellow], startPoint: .leading, endPoint: .trailing))
      .clipped()
      .padding(.bottom, 16)

      Group {
        Text("The distance between the Sun and Earth is")
          .font(.headline)
        Gauge(value: isGaugeFilled ? 100 : 0, in: 0...100) {
        } currentValueLabel: {
          HStack {
            Text("The distance is about")
            Text(distance.toKilometers)
          }
          .opacity(distance == 0 ? 0 : 1)
        } minimumValueLabel: {
          Text("☀️")
        } maximumValueLabel: {
          Text("🌎")
        }      .padding(.bottom, 16)

        Button("Show me the distance") {
          withAnimation {
            calculateDistance()
          }
        }
        .buttonStyle(.borderedProminent)
        .font(.headline)
        .clipShape(.capsule)
      }
      .padding(.horizontal)
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
      distance = earth.distanceFromSunKm
      isGaugeFilled = true
    }
  }
}

struct PlanetCardView: View {
  private let planet: Planet

  init(planet: Planet) {
    self.planet = planet
  }

  var body: some View {
    VStack {
      Image(planet.name)
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
      Text(planet.name.capitalized)
        .font(.headline)
    }
  }
}

#Preview {
  NavigationStack {
    HomeView(planets: .preview)
  }
}
