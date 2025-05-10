//
//  Planet.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 05/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import Foundation

struct Planet: Decodable, Hashable {
  let name: String
  let title: String
  let description: String
  let diameterKm: Int
  let distanceFromSunKm: Int
}

extension [Planet] {
  static var preview: [Planet] {
    do {
      let fileURL = Bundle.main.url(forResource: "planets", withExtension: "json")!
      let data = try Data(contentsOf: fileURL)
      let decoder = JSONDecoder()
      return try decoder.decode([Planet].self, from: data)
    } catch {
      fatalError("Data could not be decoded")
    }
  }
}

extension Planet {
  static let preview = [Planet].preview.first!
}
