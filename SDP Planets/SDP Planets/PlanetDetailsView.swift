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
      imageSectionView
      descriptionSectionView
      diameterSectionView
      distanceSectionView
    }
    .navigationTitle(planet.title)
    .navigationBarTitleDisplayMode(.inline)
  }
}

// MARK: - Views

private extension PlanetDetailsView {
  var imageSectionView: some View {
    Section {
      Image(planet.name)
        .resizable()
        .scaledToFit()
    }
    .listRowBackground(Color.clear)
  }

  var descriptionSectionView: some View {
    Section("Description") {
      Text(planet.description)
    }
  }

  var diameterSectionView: some View {
    Section {
      Text(Measurement(value: Double(planet.diameterKm), unit: UnitLength.kilometers), format: .measurement(width: .abbreviated, usage: .road))
    } header: {
      Label("Diameter (km)", systemImage: "circle.lefthalf.filled.righthalf.striped.horizontal")
    }
  }

  var distanceSectionView: some View {
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
}

// MARK: - Previews

#Preview {
  NavigationStack {
    PlanetDetailsView(planet: .preview)
  }
}
