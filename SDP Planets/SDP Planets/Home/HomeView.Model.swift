//
//  Model.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 11/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import Foundation

extension HomeView {
  @Observable
  final class Model {
    private let planets: [Planet]
    var distanceEarthFromSun: String?
    var planetsSortedByDistance: [Planet] {
      planets.sorted { $0.distanceFromSunKm > $1.distanceFromSunKm }
    }

    init(planets: [Planet]) {
      self.planets = planets
    }

    private func calculateDistance() {
      let earth = planets.filter { planet in
        planet.name == "earth"
      }.first

      if let earth {
        distanceEarthFromSun = "The distance is about \(earth.distanceFromSunKm.toKilometers)"
      }
    }

    func showMeTheDistance() {
      calculateDistance()
    }
  }
}
