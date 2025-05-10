//
//  PlanetDetailsView.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 05/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//


import SwiftUI

struct PlanetDetailsView: View {
  let planet: Planet

  var body: some View {
    Form {
      Section {
        Image(planet.name)
          .resizable()
          .scaledToFit()
      }
      .listRowBackground(Color.clear)
      Section("Description") {
        Text(planet.description)
      }
      Section {
        Text(Measurement(value: Double(planet.diameterKm), unit: UnitLength.kilometers), format: .measurement(width: .abbreviated, usage: .road))
      } header: {
        Label("Diameter (km)", systemImage: "circle.lefthalf.filled.righthalf.striped.horizontal")
      }
      Section {
        Text(Measurement(value: Double(planet.distanceFromSunKm), unit: UnitLength.kilometers), format: .measurement(width: .abbreviated, usage: .road))
      } header: {
        HStack {
          Label("Distance (km)", systemImage: "ruler")
        }
      } footer: {
        Text("This is the distance from the sun")
      }
    }
    .navigationTitle(planet.title)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    PlanetDetailsView(planet: .preview)
  }
}
