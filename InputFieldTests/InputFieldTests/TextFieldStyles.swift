//
//  TextFieldStyles.swift
//  InputFieldTests
//
//  Created by Suhayl Ahmed on 11/07/2023.
//

import SwiftUI

// MARK: - InputTextFieldStyle

struct InputTextFieldStyle: TextFieldStyle {
  // MARK: Internal

  var isMandatory = false
  var isFocused = false
  var showError = false

  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding()
      .background(.blue.opacity(0.3))
      .roundedBorder(width: borderWidth, color: borderColor)
      .foregroundColor(.white)
      .safeAreaInset(edge: .leading) {
        if isMandatory {
          Text("*")
            .foregroundColor(.red)
        }
      }
  }

  // MARK: Private

  private var borderWidth: CGFloat {
    if showError || isFocused {
      return 1
    } else {
      return 0.5
    }
  }

  private var borderColor: Color {
    if showError {
      return .red
    }
    if isFocused {
      return .teal
    } else {
      return .white.opacity(0.2)
    }
  }
}

extension TextFieldStyle where Self == InputTextFieldStyle {
  static func input(isMandatory: Bool = false, isFocused: Bool, showError: Bool = false) -> Self {
    Self(isMandatory: isMandatory, isFocused: isFocused, showError: showError)
  }
}
