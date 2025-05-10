//
//  Int+Kilometers.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 09/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import Foundation

extension Int {
  var toKilometers: String {
    let measurement = Measurement(value: Double(self), unit: UnitLength.kilometers)
    
    if measurement.value >= 1_000_000_000 {
      let billions = measurement.value / 1_000_000_000
      return "\(billions.formatted(.number.precision(.fractionLength(1)))) billion \(measurement.unit.symbol)"
    } else if measurement.value >= 1_000_000 {
      let millions = measurement.value / 1_000_000
      return "\(millions.formatted(.number.precision(.fractionLength(1)))) million \(measurement.unit.symbol)"
    } else {
      return measurement.formatted(.measurement(width: .abbreviated, usage: .road))
    }
  }
}
