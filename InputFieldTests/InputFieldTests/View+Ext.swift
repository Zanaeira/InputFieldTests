//
//  View+Ext.swift
//  InputFieldTests
//
//  Created by Suhayl Ahmed on 11/07/2023.
//

import SwiftUI

private struct RoundedBorderModifier: ViewModifier {
  let cornerRadius: CGFloat
  let borderWidth: CGFloat
  let borderColor: Color?

  private var pill: RoundedRectangle {
    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
  }

  func body(content: Content) -> some View {
    content
      .clipShape(pill)
      .overlay {
        if let borderColor {
          pill.stroke(borderColor, lineWidth: borderWidth)
        }
      }
  }
}

extension View {
  func roundedBorder(cornerRadius: CGFloat = 10, width: CGFloat = 1, color: Color? = nil) -> some View {
    modifier(RoundedBorderModifier(cornerRadius: cornerRadius, borderWidth: width, borderColor: color))
  }
}

