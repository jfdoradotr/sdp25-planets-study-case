//
//  Model.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 09/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import Foundation

extension PlanetDetailsView {
  @Observable
  final class Model {
    private let planet: Planet
    var resourceName: String
    var name: String
    var description: String
    var diameter: String
    var distance: String

    init(planet: Planet) {
      self.planet = planet
      resourceName = planet.name
      name = planet.title
      description = planet.description
      diameter = planet.diameterKm.toKilometers
      distance = planet.distanceFromSunKm.toKilometers
    }
  }
}

private extension Int {
  var toKilometers: String {
    return Measurement(
      value: Double(self),
      unit: UnitLength.kilometers
    ).formatted(.measurement(width: .abbreviated, usage: .road))
  }
}
