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
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
          Menu("Sort") {
            Button("Name", systemImage: "textformat.alt") {
              model.sort(by: .name)
            }
            Button("Diameter", systemImage: "circle.dashed") {
              model.sort(by: .diameter)
            }
            Button("Distance to Sun", systemImage: "sun.max") {
              model.sort(by: .distance)
            }
          }
        }
      }
    }
  }
}

extension PlanetsListView {
  @Observable
  final class Model {
    private(set) var planets: [Planet]
    private(set) var sortOption: SortOption = .name
    
    init(planets: [Planet]) {
      self.planets = planets
      sortPlanets()
    }
    
    func sort(by option: SortOption) {
      sortOption = option
      sortPlanets()
    }
    
    private func sortPlanets() {
      switch sortOption {
      case .name:
        planets.sort { $0.title < $1.title }
      case .diameter:
        planets.sort { $0.diameterKm > $1.diameterKm }
      case .distance:
        planets.sort { $0.distanceFromSunKm < $1.distanceFromSunKm }
      }
    }
  }
  
  enum SortOption {
    case name
    case diameter
    case distance
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
