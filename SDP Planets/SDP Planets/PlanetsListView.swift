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
    .animation(.smooth, value: model.planets)
    .navigationTitle("Planets")
    .navigationDestination(for: Planet.self, destination: { item in
      PlanetDetailsView(model: .init(planet: item))
    })
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
          Menu("Sort") {
            ForEach([SortOption.name, .diameter, .distance], id: \.self) { option in
              Button {
                model.sort(by: option)
              } label: {
                Label(option.title, systemImage: option.icon)
              }
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
      withAnimation {
        sortOption = option
        sortPlanets()
      }
    }
    
    private func sortPlanets() {
      switch sortOption {
      case .name:
        planets.sort { $0.title.localizedStandardCompare($1.title) == .orderedAscending }
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
    
    var title: String {
      switch self {
      case .name: "Name"
      case .diameter: "Diameter"
      case .distance: "Distance to Sun"
      }
    }
    
    var icon: String {
      switch self {
      case .name: "textformat.alt"
      case .diameter: "circle.dashed"
      case .distance: "sun.max"
      }
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
