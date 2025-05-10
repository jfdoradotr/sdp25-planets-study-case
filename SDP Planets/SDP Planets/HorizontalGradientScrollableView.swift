//
//  HorizontalGradientScrollableView.swift
//  SDP Planets
//
//  Created by Juan Francisco Dorado Torres on 09/05/25.
//
//  Swift Developer Program 2025
//  Apple Coding Academy
//  https://acoding.academy/formaciones/swift-developer-program/
//

import SwiftUI

struct HorizontalGradientScrollableView<Content: View>: View {
  var height: CGFloat = 200
  @ViewBuilder let content: Content

  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        content
      }
    }
    .safeAreaPadding()
    .scrollIndicators(.hidden)
    .frame(height: height)
    .background(LinearGradient(colors: [.blue, .purple, .red, .orange, .yellow], startPoint: .leading, endPoint: .trailing))
    .clipped()
  }
}

#Preview {
  HorizontalGradientScrollableView {
    ForEach(0..<20) { index in
      Text("Item \(index)")
    }
  }
}
