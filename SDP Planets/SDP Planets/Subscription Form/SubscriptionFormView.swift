//
//  SubscriptionFormView.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 08/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//


import SwiftUI

struct SubscriptionFormView: View {
  @State private var viewModel = SubscriptionFormView.Model()

  var body: some View {
    Form {
      basicInfoSectionView
      topicSelectionSectionView
      submitSectionView

    }
    .navigationTitle("Subscribe 🌎")
    .alert("Thanks \(viewModel.name) ⭐", isPresented: $viewModel.isAlertPresented, actions: {}, message: {
      Text("✉️ We will send you a confirmation email shortly to \(viewModel.email)")
    })
  }
}

// MARK: - Views

private extension SubscriptionFormView {
  var basicInfoSectionView: some View {
    Section {
      TextField("How do we call you?", text: $viewModel.name)
        .keyboardType(.namePhonePad)
      TextField("Your best email", text: $viewModel.email)
        .keyboardType(.emailAddress)
    } header: {
      Text("Basic info")
    }
  }

  var topicSelectionSectionView: some View {
    Section {
      Picker("Category", selection: $viewModel.topic) {
        ForEach(SubscriptionFormView.Model.Topic.allCases, id: \.self) { topic in
          Text(topic.rawValue)
            .tag(topic)
        }
      }
    } header: {
      Text("Your best topic to learn")
    }
  }

  var submitSectionView: some View {
    Section {
      Button("Send") {
        viewModel.isAlertPresented = true
      }
      .disabled(!viewModel.canSubmit)
    } header: {
      Text("You are one step away from being a part of our community!")
    }
  }
}

// MARK: - Previews

#Preview {
  NavigationStack {
    SubscriptionFormView()
  }
}
