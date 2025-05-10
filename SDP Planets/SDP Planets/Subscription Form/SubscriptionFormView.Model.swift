//
//  SubscriptionFormView.Model.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 09/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import Foundation

extension SubscriptionFormView {
  @Observable
  final class Model {
    var name = ""
    var email = ""
    var topic: Topic = .other
    var isAlertPresented = false

    var canSubmit: Bool {
      isValidInput(name) && isValidInput(email)
    }

    func isValidInput(_ input: String) -> Bool {
      !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
  }
}

extension SubscriptionFormView.Model {
  enum Topic: String, CaseIterable {
    case planets
    case space
    case astronomy
    case astrophysics
    case other
  }
}
