//
//  AppTextEditor.swift
//  WecareForU
//
//  Created by apple on 4/29/22.
//

import SwiftUI

struct AppTextEditor: View {

  @Binding var message: String
  let placeholder: LocalizedStringKey

  var body: some View {
    ZStack(alignment: .topLeading) {
      if message.isEmpty {
        Text(placeholder)
          .padding(8)
          .font(.body)
          .foregroundColor(Color.TextField.textColor)
      }
      TextEditor(text: $message)
        .frame(height: 170)
        .opacity(message.isEmpty ? 0.25 : 1)

    }
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(Color.white, lineWidth: 1))
  }
}

//struct AppTextEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        AppTextEditor(message: <#Binding<String>#>, placeholder: <#LocalizedStringKey#>)
//    }
//}
