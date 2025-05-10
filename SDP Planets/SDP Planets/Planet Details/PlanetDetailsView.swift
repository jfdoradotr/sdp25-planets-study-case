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
  @State private var model: PlanetDetailsView.Model

  init(model: PlanetDetailsView.Model) {
    self.model = model
  }

  var body: some View {
    Form {
      imageSectionView
      descriptionSectionView
      diameterSectionView
      distanceSectionView
    }
    .navigationTitle(model.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

// MARK: - Views

private extension PlanetDetailsView {
  var imageSectionView: some View {
    Section {
      Image(model.resourceName)
        .resizable()
        .scaledToFit()
    }
    .listRowBackground(Color.clear)
  }

  var descriptionSectionView: some View {
    Section("Description") {
      Text(model.description)
    }
  }

  var diameterSectionView: some View {
    Section {
      Text(model.diameter)
    } header: {
      Label("Diameter (km)", systemImage: "circle.lefthalf.filled.righthalf.striped.horizontal")
    }
  }

  var distanceSectionView: some View {
    Section {
      Text(model.distance)
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
    PlanetDetailsView(model: .init(planet: .preview))
  }
}
