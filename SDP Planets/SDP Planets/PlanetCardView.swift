//
//  PlanetCardView.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 09/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import SwiftUI

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
  PlanetCardView(planet: .preview)
}
