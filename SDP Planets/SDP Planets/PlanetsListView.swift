//
//  PlanetsListView.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 05/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import SwiftUI

struct PlanetsListView: View {
  @State var model: PlanetsListView.Model

  init(model: PlanetsListView.Model) {
    self.model = model
  }

  var body: some View {
    List {
      ForEach(model.planets, id: \.name) { planet in
        NavigationLink(value: planet) {
          Row(imageName: planet.name, name: planet.title)
        }
      }
    }
    .listStyle(.plain)
    .navigationTitle("Planets")
    .navigationDestination(for: Planet.self, destination: { item in
      PlanetDetailsView(model: .init(planet: item))
    })
  }
}

extension PlanetsListView {
  @Observable
  final class Model {
    private(set) var planets: [Planet]

    init(planets: [Planet]) {
      self.planets = planets
    }
  }
}

private extension PlanetsListView {
  struct Row: View {
    let imageName: String
    let name: String

    var body: some View {
      HStack {
        Image(imageName)
          .resizable()
          .scaledToFit()
          .frame(width: 100, height: 100)
        Text(name)
          .font(.headline)
      }
    }
  }
}

#Preview {
  NavigationStack {
    PlanetsListView(model: .init(planets: .preview))
  }
}

#Preview {
  PlanetsListView.Row(imageName: "earth", name: "Tierra")
}
