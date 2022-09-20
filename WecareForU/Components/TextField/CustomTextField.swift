//
//  CustomTextField.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

struct CustomTextField: View {
    var systemImageName         : String = ""
    var titleKey                : LocalizedStringKey
    @Binding var text           : String
    @State private var isEditing: Bool = false
    var isSecure                : Bool = false
    var labelName               : LocalizedStringKey?
    public let onEditingChanged : (Bool) -> Void
    public let onCommit         : () -> Void
    
    public init(_ titleKey: LocalizedStringKey,
                text: Binding<String>,
                systemImageName: String = "",
                isSecure: Bool = false,
                labelName: LocalizedStringKey? = nil,
                onEditingChanged: @escaping ((Bool) -> Void) = { _ in },
                onCommit: @escaping () -> Void = {}
    ) {
        self.titleKey  = titleKey
        self._text     = text
        self.systemImageName = systemImageName
        self.isSecure  = isSecure
        self.labelName = labelName
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if labelName != nil {
                TextFieldLabel(name: labelName)
            }
                if isSecure {
                    SecureField(titleKey, text: $text) {
                        onCommit()
                    }
                    .padding(12)
                    .foregroundColor(.TextField.textColor)
                    .background(Color.white)
                    .cornerRadius(6)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .shadow(color: .TextField.darkShadow, radius: 1, x: 1, y: 1)
                    .shadow(color: .TextField.lightShadow, radius: 1, x: -1, y: -1)
                }else {
                    TextField(titleKey, text: $text, onEditingChanged: {
                        isEditing = $0
                        onEditingChanged($0)
                    })
                    .padding(12)
                    .foregroundColor(isEditing ? .black : .TextField.textColor)
                    .background(Color.white)
                    .cornerRadius(6)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .shadow(color: .TextField.darkShadow, radius: 1, x: 1, y: 1)
                    .shadow(color: .TextField.lightShadow, radius: 1, x: -1, y: -1)
                }            
        }
    }
    
}

struct TextFieldLabel: View {
    var name: LocalizedStringKey?
    var body: some View {
        Text(name ?? "Field")
            .font(.fontWith(.regular, size: .small))
            .foregroundColor(.TextField.topLabel)
            .padding(2)
    }
}
