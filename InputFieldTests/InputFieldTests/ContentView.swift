//
//  ContentView.swift
//  InputFieldTests
//
//  Created by Suhayl Ahmed on 11/07/2023.
//

import SwiftUI

struct ContentView: View {
  
  enum FocusableField {
    case address1
    case address2
    case townCity
    case postcode
  }
  
  @StateObject var viewModel = AddressViewModel()
  @FocusState var focus: FocusableField?
  
  var body: some View {
    ScrollView {
      TextField("Address", text: $viewModel.addressLine1)
        .textFieldStyle(.input(isMandatory: true, isFocused: focus == .address1))
        .focused($focus, equals: .address1)
        .onSubmit { focus = .address2 }
      
      TextField("Address line 2", text: $viewModel.addressLine2)
        .textFieldStyle(.input(isFocused: focus == .address2))
        .focused($focus, equals: .address2)
        .onSubmit { focus = .townCity }
      
      TextField("Town/city", text: $viewModel.townCity)
        .textFieldStyle(.input(isMandatory: true, isFocused: focus == .townCity))
        .focused($focus, equals: .townCity)
        .onSubmit { focus = .postcode }
      
      let invalid = viewModel.invalidPostcode
      TextField("Postcode", text: $viewModel.postcode)
        .textFieldStyle(.input(isMandatory: true, isFocused: focus == .postcode, showError: invalid))
        .focused($focus, equals: .postcode)
        .padding(.horizontal, invalid ? 4 : 0)
      
      if invalid {
        Text("Please enter a valid postcode.")
          .foregroundColor(.red)
      }
    }
    .padding(.horizontal, 16)
  }
}

final class AddressViewModel: ObservableObject {
  @Published var addressLine1 = ""
  @Published var addressLine2 = ""
  @Published var townCity = ""
  @Published var postcode = ""
  var invalidPostcode: Bool { postcode.isEmpty }
}
