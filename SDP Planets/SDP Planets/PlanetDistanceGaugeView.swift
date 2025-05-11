//
//  PlanetDistanceGaugeView.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 09/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import SwiftUI

struct PlanetDistanceGaugeView: View {
  let headerText: String
  let distanceText: String?

  private var isDistanceShown: Bool { distanceText != nil }

  var body: some View {
    VStack {
      Text(headerText)
        .font(.headline)
      Gauge(value: isDistanceShown ? 100 : 0, in: 0...100) {
      } currentValueLabel: {
        Text(distanceText ?? "")
          .opacity(isDistanceShown ? 1 : 0)
      } minimumValueLabel: {
        Text("☀️")
      } maximumValueLabel: {
        Text("🌎")
      }
    }
  }
}

#Preview {
  PlanetDistanceGaugeView(
    headerText: "The distance between the Sun and Earth is",
    distanceText: "The distance is about 149.6 km"
  )
}
